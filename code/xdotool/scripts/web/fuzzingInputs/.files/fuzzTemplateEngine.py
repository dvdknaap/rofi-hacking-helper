#!/usr/bin/env python3
import argparse
import logging
import re
from typing import Dict, Optional, Tuple, List, Union, Any
from urllib.parse import urlparse, parse_qs, urlencode, quote_plus, unquote_plus

import requests
# Disable warnings for insecure requests if using --https without verification
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

logging.basicConfig(level=logging.INFO, format='%(levelname)s - %(message)s')

# --- Exceptions ---
class SstiDetectorError(Exception):
    """Base exception for the detector."""
    pass

class RequestParsingError(SstiDetectorError):
    """Error during Burp request file parsing."""
    pass

class ParameterNotFoundError(SstiDetectorError):
    """Error when the injection parameter cannot be found."""
    pass

class RequestSendError(SstiDetectorError):
    """Error during HTTP request sending."""
    pass

# --- Main Detector Class ---
class SstiDetector:
    """
    Detects server-side template injection vulnerabilities and attempts to identify
    the template engine based on a series of probes derived from a Burp request file.

    The detection logic primarily checks if the injected payload is reflected *as-is*
    in the response. If the payload is missing or altered significantly, it suggests
    processing by a template engine.
    """
    _method: str
    _path: str
    _headers: Dict[str, str]
    _body: Optional[str]
    _host: str
    _scheme: str
    _base_url: str
    _injection_param: str
    _injection_location: str # 'query' or 'body'
    _original_query_params: Dict[str, List[str]]
    _original_body_params: Dict[str, List[str]]
    _timeout: int
    _session: requests.Session

    _ENGINE_SMARTY = "Smarty"
    _ENGINE_MAKO = "Mako"
    _ENGINE_JINJA2 = "Jinja2"
    _ENGINE_TWIG = "Twig"
    _ENGINE_UNKNOWN = "Unknown"
    _ENGINE_NOT_VULNERABLE = "Not Vulnerable"

    def __init__(self, 
                 burp_filepath: str, 
                 test_param: Optional[str] = None, 
                 force_https: Optional[bool] = None, # None=auto, True=force https, False=force http
                 timeout: int = 10):
        """
        Initializes the SstiDetector.

        Args:
            burp_filepath: Path to the Burp Suite request file.
            test_param: Specific parameter name to inject into. If None, searches
                          for a parameter with value '*' in the request file.
            timeout: Request timeout in seconds.

        Raises:
            RequestParsingError: If the Burp file cannot be parsed.
            ParameterNotFoundError: If the injection parameter is not found.
        """
        logging.info(f"Initializing detector for request file: {burp_filepath}")
        self._timeout = timeout
        self._session = requests.Session() # Use a session for potential connection reuse

        try:
            self._method, self._path, self._headers, self._body, self._host = self._parse_burp_request(burp_filepath)
        except Exception as e:
            raise RequestParsingError(f"Failed to parse Burp request file: {e}") from e

        # Determine scheme (http/https)
        self._target_host, self._target_port, detected_scheme = self._detect_scheme_from_host(self._host)
        logging.info(f"Parsed Host: {self._target_host}, Port: {self._target_port or 'default'}, Auto-detected Scheme: {detected_scheme}")

        # Apply override if provided
        if force_https is True:
            self._scheme = "https"
            logging.info("Overriding auto-detection: Forcing HTTPS due to flag.")
        else:
            self._scheme = detected_scheme # Use auto-detected scheme

        # Construct base URL using the *original* host header value (which includes port if non-default)
        self._base_url = f"{self._scheme}://{self._host}"
        logging.info(f"Target base URL: {self._base_url}, Method: {self._method}")

        # Ensure Host header matches scheme if needed (less common to mismatch, but safer)
        self._headers['Host'] = self._host

        try:
            self._injection_param, self._injection_location, self._original_query_params, self._original_body_params = self._find_injection_param(self._path, self._body, test_param)
            logging.info(f"Identified injection point: Parameter='{self._injection_param}', Location='{self._injection_location}'")
        except ValueError as e:
            raise ParameterNotFoundError(str(e)) from e

    @staticmethod
    def _parse_burp_request(filepath: str) -> Tuple[str, str, Dict[str, str], Optional[str], str]:
        """
        Parses a standard Burp Suite request file.

        Args:
            filepath: Path to the request file.

        Returns:
            A tuple containing: (method, path_with_query, headers_dict, body_str_or_none, host_header_value).

        Raises:
            FileNotFoundError: If the file doesn't exist.
            ValueError: If the request format is invalid (e.g., cannot parse request line or find Host header).
        """
        try:
            with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
                raw_request = f.read()
        except FileNotFoundError:
            logging.error(f"Burp request file not found: {filepath}")
            raise

        parts = raw_request.split('\n\n', 1)
        header_section = parts[0]
        body = parts[1].strip() if len(parts) > 1 else None

        header_lines = header_section.splitlines()

        if not header_lines:
            raise ValueError("Request file is empty or header section is missing.")

        request_line = header_lines[0]
        headers: Dict[str, str] = {}

        for line in header_lines[1:]:
            if ':' in line:
                key, value = line.split(':', 1)
                headers[key.strip()] = value.strip()
            elif line.strip(): # Non-empty line without colon might be invalid
                logging.warning(f"Ignoring potentially malformed header line: {line}")


        try:
            method, path, _ = request_line.split(' ', 2)
        except ValueError:
            raise ValueError(f"Could not parse request line: '{request_line}'")

        host = headers.get('Host')

        if not host:
            raise ValueError("'Host' header is missing in the request file.")

        return method.upper(), path, headers, body, host

    @staticmethod
    def _detect_scheme_from_host(host_header: str) -> Tuple[str, Optional[int], str]:
        """
        Attempts to detect the scheme (http/https) based on the port in the Host header.

        Args:
            host_header: The value of the Host header (e.g., "example.com", "example.com:443").

        Returns:
            A tuple: (hostname, port or None, detected_scheme ("http" or "https")).
                     Port is None if not specified or standard (80/443 inferred).
                     Scheme defaults to "http" unless port is 443.
        """
        hostname = host_header
        port: Optional[int] = None
        scheme = "http" # Default scheme

        if ':' in host_header:
            parts = host_header.rsplit(':', 1)
            hostname = parts[0]
             # Check if the part after the colon is a valid port number
            if parts[1].isdigit():
                port_num = int(parts[1])
                port = port_num
                if port_num == 443:
                    scheme = "https"
                elif port_num == 80:
                    scheme = "http"
                # else: keep default http for other ports unless overridden later
            else:
                 # Malformed host header (e.g., IPv6 without brackets?), log warning
                 logging.warning(f"Could not parse port from Host header: '{host_header}'. Assuming default port for scheme.")
                 # Attempt to handle common IPv6 case [::1]:port
                 if hostname.startswith('[') and hostname.endswith(']'):
                     # It was likely an IPv6 address, port parsing failed means no port specified?
                     pass # Keep default scheme/port
                 else:
                     hostname = host_header # Revert hostname if split was incorrect
        # else: No port specified, default scheme is http, port is None (implying 80 for http, 443 for https)

        return hostname, port, scheme

    @staticmethod
    def _find_injection_param(path: str, body: Optional[str], test_param: Optional[str]) -> Tuple[str, str, Dict[str, List[str]], Dict[str, List[str]]]:
        """
        Finds the parameter to inject into, prioritizing test_param, then '*'.

        Args:
            path: The request path including query string.
            body: The request body (expected as form-urlencoded for body injection).
            test_param: The explicitly requested parameter name.

        Returns:
            A tuple containing: (parameter_name, location ('query' or 'body'),
                                parsed_query_params, parsed_body_params).

        Raises:
            ValueError: If the specified parameter is not found, or if no parameter
                        is specified and no '*' marker is found.
        """
        parsed_url = urlparse(path)
        query_params = parse_qs(parsed_url.query, keep_blank_values=True)
        body_params: Dict[str, List[str]] = {}

        if body:
            try:
                # Only parse if likely form-urlencoded
                # A more robust check might look at Content-Type header, but parse_qs is forgiving
                body_params = parse_qs(body, keep_blank_values=True)
            except Exception as e:
                logging.warning(f"Could not parse body as form-urlencoded, body injection might fail: {e}")

        # Priority 1: Explicit test_param
        if test_param:
            if test_param in query_params:
                return test_param, 'query', query_params, body_params
            elif test_param in body_params:
                return test_param, 'body', query_params, body_params
            else:
                raise ValueError(f"Specified parameter '{test_param}' not found in request query or body.")

        # Priority 2: Find parameter with value '*'
        for location, params_dict in [('query', query_params), ('body', body_params)]:
            for key, values in params_dict.items():
                if '*' in values[0]:
                    logging.debug(f"Found injection marker '*' in {location} parameter: {key}")
                    return key, location, query_params, body_params # Return original parsed params

        raise ValueError("No parameter value found with '*' and no --param specified. Mark a parameter value with '*' or use --param.")

    def _prepare_request_args(self, payload: str) -> Dict[str, Any]:
        """
        Prepares the arguments (URL, params, data, headers) for requests.request.

        Args:
            payload: The payload string to inject.

        Returns:
            A dictionary suitable for splatting into requests.request(**args).
        """
        current_query_params = self._original_query_params.copy()
        current_body_params = self._original_body_params.copy()
        current_headers = self._headers.copy()
        data_body: Optional[Union[str, bytes]] = None

        # Inject payload
        if self._injection_location == 'query':
            current_query_params[self._injection_param] = [payload]
        elif self._injection_location == 'body':
            if current_body_params[self._injection_param][0]:
                if '*' in current_body_params[self._injection_param][0]:
                    current_body_params[self._injection_param] = current_body_params[self._injection_param][0].replace('*', payload)
                else:
                    current_body_params[self._injection_param] = current_body_params[self._injection_param][0] + payload

            else:
                current_body_params[self._injection_param] = [payload]

        # Reconstruct query string
        target_url_parts = urlparse(self._path)
        query_string = urlencode(current_query_params, doseq=True)
        final_url = f"{self._base_url}{target_url_parts.path}"
        # Add query string if it exists
        if query_string:
             final_url += "?" + query_string

        # Reconstruct body if needed (assuming x-www-form-urlencoded for modification)
        if self._method in ('POST', 'PUT', 'PATCH'):
            content_type = current_headers.get('Content-Type', '').lower()
            if self._injection_location == 'body' and 'application/x-www-form-urlencoded' in content_type:
                 data_body = urlencode(current_body_params, doseq=True)
                 #data_body = current_body_params
                 # Requests recalculates Content-Length if data is provided
                 current_headers.pop('Content-Length', None)
            elif self._injection_location == 'body':
                 # Injecting into body, but not form-urlencoded. This is problematic.
                 # We'll send the original body but log a warning. A better approach
                 # might be needed for JSON/XML etc., requiring specific parsing/reconstruction.
                 logging.warning(f"Attempting body injection into non-form-urlencoded content type '{content_type}'. Sending original body.")
                 # Option: try injecting anyway (might break structure)
                 # Option: send original body (payload ignored) - let's do this for now
                 data_body = self._body
                 # Need to ensure Content-Length is still valid for the *original* body if present
                 if data_body and 'Content-Length' not in current_headers:
                      current_headers['Content-Length'] = str(len(data_body.encode('utf-8'))) # Assuming utf-8

            elif self._body is not None : # Injection was in query, but there *was* an original body
                 # Send the original body content if it existed.
                 data_body = self._body
                 # Ensure content-length is correct for the *original* body
                 if 'Content-Length' not in current_headers:
                      current_headers['Content-Length'] = str(len(data_body.encode('utf-8')))


        return {
            "method": self._method,
            "url": final_url,
            "headers": current_headers,
            "data": data_body,
            "timeout": self._timeout,
            "verify": False, # Matches Burp default, disable SSL verification
            "allow_redirects": False # Crucial for accurate testing
        }

    def _send_payload(self, payload: str) -> Optional[requests.Response]:
        """
        Sends the HTTP request with the injected payload.

        Args:
            payload: The payload string to inject.

        Returns:
            The requests.Response object if successful, None otherwise.
        """
        request_args = self._prepare_request_args(payload)
        logging.debug(f"Sending Payload: {payload}")
        logging.debug(f"  URL: {request_args['url']}")

        if request_args['data']:
            # Avoid logging potentially huge data payloads fully
            data_preview = repr(request_args['data'])[:100]
            logging.debug(f"  Data: {data_preview}{'...' if len(repr(request_args['data'])) > 100 else ''}")
        # logging.debug(f"  Headers: {request_args['headers']}")

        try:
            response = self._session.request(**request_args)
            logging.debug(f"  Received Status: {response.status_code}")
            return response
        except requests.exceptions.Timeout:
            logging.error(f"Request timed out after {self._timeout} seconds for payload: {payload}")
            return None
        except requests.exceptions.RequestException as e:
            logging.error(f"Request failed for payload '{payload}': {e}")
            # Raise a custom exception to be caught by the main detector logic if needed
            # raise RequestSendError(f"Request failed for payload '{payload}': {e}") from e
            return None # Or return None to indicate failure


    def _check_payload_processed(self, payload: str, expected_output: str | None = None) -> bool:
        """
        Sends a payload and checks if it was likely processed by the template engine.

        By default, checks if the raw payload string is *absent* from the response body.
        If `expected_output` is provided, it checks if that specific string *is present*.

        Args:
            payload: The payload to inject.

        Returns:
            True if the payload appears to have been processed, False otherwise
            (or if the request fails).
        """
        response = self._send_payload(payload)
        if response is None:
            return False

        logging.debug(f"response.text: {response.text}")
        # Check if the original payload is present
        if payload not in response.text:
            logging.debug(f"[+] Payload '{payload}' processed: payload is absent.")
            if expected_output:
                if expected_output in response.text:
                    return True
                else:
                    return False
            else:
                return True
        else:
            logging.debug(f"[-] Payload '{payload}' processed: payload is present.")
            return False

    def check_template_engine_injection(self) -> bool:
        template_command = "${7*7}"
        logging.debug(f"Payload 1: Checking '{template_command}'")
        return self._check_payload_processed(template_command)
    
    def check_if_template_engine_smarty(self) -> bool:
        template_command = "a{*comment*}b"
        logging.debug(f"Payload 1.1: Checking '{template_command}'")
        return self._check_payload_processed(template_command)
    
    def check_if_template_engine_mako(self) -> bool:
        template_command = '${"z".join("ab")}'
        logging.debug(f"Payload 1.2: Checking '{template_command}'")
        return self._check_payload_processed(template_command)

    def check_template_engine_injection_without_dollar(self) -> bool:
        template_command = "{{7*7}}"
        logging.debug(f"Payload 2: Checking '{template_command}'")
        return self._check_payload_processed(template_command)
    
    def check_template_engine_injection_jinja(self) -> bool:
        template_command = "{{7*'7'}}"
        expected_output = '7777777'
        logging.debug(f"Payload 2.1: Checking '{template_command}', expected output: {expected_output}")
        return self._check_payload_processed(template_command, expected_output)
    
    def check_template_engine_injection_twig(self) -> bool:
        template_command = "{{7*'7'}}"
        expected_output = '49'
        logging.debug(f"Payload 2.2: Checking '{template_command}', expected output: {expected_output}")
        return self._check_payload_processed(template_command, expected_output)
    
    def detect(self) -> str:
        """
        Runs the template engine detection sequence.

        Returns:
            The name of the most likely template engine (str) or
            ENGINE_NOT_VULNERABLE / ENGINE_UNKNOWN.
        """
        logging.debug("Starting template engine detection probes...")

        if self.check_template_engine_injection():
            if self.check_if_template_engine_smarty():
                 return self._ENGINE_SMARTY
            elif self.check_if_template_engine_mako():
                 return self._ENGINE_SMARTY
            else:
                return self._ENGINE_UNKNOWN
        elif self.check_template_engine_injection_without_dollar():
            if self.check_template_engine_injection_jinja():
                 return self._ENGINE_JINJA2
            elif self.check_template_engine_injection_twig():
                 return self._ENGINE_TWIG
            else:
                return self._ENGINE_UNKNOWN
        else:
            logging.error("[-] No template syntax (${...} or {{...}}) detected processing the basic multiplication probes.")
            return self._ENGINE_NOT_VULNERABLE

# --- Command Line Interface ---
def main():
    """Parses arguments and runs the detector."""
    parser = argparse.ArgumentParser(
        description="Detect template engine based on SSTI probes using a Burp request file. Auto-detects HTTP/HTTPS based on port 443 unless overridden.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    parser.add_argument(
        "-f", "--file",
        required=True,
        help="Path to the Burp Suite request file."
    )
    parser.add_argument(
        "-p", "--test-param",
        help="Parameter name to test (overrides '*' marker in the request file)."
    )
    parser.add_argument(
        "--https",
        action="store_true",
        help="Force HTTPS (overrides auto-detection based on port)."
    )
    parser.add_argument(
        "-t", "--timeout",
        type=int,
        default=10,
        help="Request timeout in seconds."
    )
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Enable debug logging."
    )

    args = parser.parse_args()

    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)
    else:
        logging.getLogger().setLevel(logging.INFO) # Ensure INFO level if not verbose

    try:
        detector = SstiDetector(
            burp_filepath=args.file,
            test_param=args.test_param,
            force_https=args.https,
            timeout=args.timeout
        )
        result = detector.detect()
        logging.info(f"Detection Result: {result}")

    except (SstiDetectorError, FileNotFoundError) as e:
        logging.error(f"Error: {e}")
        exit(1)
    except Exception as e:
        logging.exception(f"An unexpected error occurred: {e}") # Log stack trace for unexpected errors
        exit(1)

if __name__ == "__main__":
    main()
