import argparse
import string
import requests
import json
from urllib.parse import parse_qs, urlparse
from requests import Response

def parse_params(param_string: str) -> dict[str, str]:
    """Parse a query string into a dictionary."""
    try:
        if param_string.startswith("?"):
            param_string = param_string[1:]
        parsed = parse_qs(param_string)
        return {k: v[0] for k, v in parsed.items()}
    except Exception as e:
        print(f"Failed to parse params: {e}")
        return {}


def parse_burp_request(file_path: str) -> dict:
    """Parse the raw HTTP request from a Burp Suite export."""
    try:
        with open(file_path, "r") as f:
            content = f.read()

        lines = content.strip().splitlines()
        request_line = lines[0]
        method, path, _ = request_line.split()

        headers = {}
        body = ""
        in_body = False

        for line in lines[1:]:
            if not in_body:
                if line.strip() == "":
                    in_body = True
                    continue
                key, value = line.split(":", 1)
                headers[key.strip()] = value.strip()
            else:
                body += line

        host = headers.get("Host", "")
        scheme = "https" if headers.get("X-Forwarded-Proto") == "https" or ":443" in host else "http"
        full_url = f"{scheme}://{host}{path}"

        params = {}
        json_body = False
        content_type = headers.get("Content-Type", "")

        if method.upper() == "GET":
            parsed = urlparse(full_url)
            params = {k: v[0] for k, v in parse_qs(parsed.query).items()}
            full_url = f"{scheme}://{host}{parsed.path}"  # remove query
        elif method.upper() == "POST":
            if "application/json" in content_type:
                try:
                    params = json.loads(body)
                    json_body = True
                except json.JSONDecodeError:
                    pass
            else:
                params = {k: v[0] for k, v in parse_qs(body).items()}

        cookie = headers.get("Cookie")
        return {
            "method": method.lower(),
            "url": full_url,
            "headers": headers,
            "params": params,
            "cookie": cookie,
            "json_body": json_body,
        }

    except Exception as e:
        print(f"Failed to parse Burp request file: {e}")
        return {}


def send_request(method: str, url: str, params: dict, headers: dict, json_body: bool) -> Response | None:
    """Send HTTP request based on method and return the response."""
    try:
        if method == "get":
            return requests.get(url, params=params, headers=headers)
        else:
            if json_body:
                return requests.post(url, json=params, headers=headers)
            return requests.post(url, data=params, headers=headers)
    except requests.RequestException as e:
        print(f"Request failed: {e}")
        return None


def test_breaking_characters(url: str, method: str, headers: dict, base_params: dict, test_param: str, invalid_text: str, json_body: bool) -> list[str]:
    """Test the breaking characters by sending requests with different punctuation characters."""
    breaking_chars = []

    for char in string.punctuation:
        test_params = base_params.copy()
        test_params[test_param] = char

        response = send_request(method, url, test_params, headers, json_body)
        if response and invalid_text in response.text:
            print(f"Breaking character found: {repr(char)}")
            breaking_chars.append(char)

    return breaking_chars


def main() -> None:
    """Main entry point of the script."""
    parser = argparse.ArgumentParser(description="Test breaking chars via HTTP requests.")
    parser.add_argument("--url", help="Target URL")
    parser.add_argument("--method", choices=["get", "post"], help="HTTP method")
    parser.add_argument("--cookie", help="Cookie header (e.g. 'key=value')")
    parser.add_argument("--params", help="Base parameters as JSON string or query string")
    parser.add_argument("--test-param", help="The param name to test with payload chars (or use * in request file)")
    parser.add_argument("--invalid-text", required=True, help="Text in response indicating breakage")
    parser.add_argument("--request-file", help="Raw HTTP request file from Burp")

    args = parser.parse_args()

    if args.request_file:
        burp_data = parse_burp_request(args.request_file)
        if not burp_data:
            print("Failed to parse request file.")
            return

        url = burp_data["url"]
        method = burp_data["method"]
        headers = burp_data["headers"]
        base_params = burp_data["params"]
        if burp_data["cookie"]:
            headers["Cookie"] = burp_data["cookie"]
        json_body = burp_data["json_body"]

        test_param = next((k for k, v in base_params.items() if "*" in v), None)
        if test_param:
            base_params[test_param] = ""  # prepare for char injection
        elif not args.test_param:
            print("No test param provided and none marked with '*' in request file.")
            return
        test_param = test_param or args.test_param
    else:
        url = args.url
        method = args.method.lower()
        headers = {}
        if args.cookie:
            headers["Cookie"] = args.cookie
        try:
            base_params = json.loads(args.params)
        except json.JSONDecodeError:
            base_params = parse_params(args.params)
        test_param = args.test_param
        json_body = False

    breaking_chars = test_breaking_characters(url, method, headers, base_params, test_param, args.invalid_text, json_body)

    print("\nBreaking characters detected:")
    print("".join(breaking_chars))


if __name__ == "__main__":
    main()
