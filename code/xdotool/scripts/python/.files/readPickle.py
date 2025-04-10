#!/usr/bin/env python3

import pickle
import base64
import argparse
import os.path

def main() -> None:
    parser = argparse.ArgumentParser(description="Decode a base64-encoded pickle object from a base64 string or file.")
    parser.add_argument("--input", required=True, help="input name, base64 string or file")

    args = parser.parse_args()

    try:
        if os.path.isfile(args.input):
            with open(args.input, "rb") as f:
                content = f.read()
                data = base64.b64decode(content)
        else:
            data = base64.b64decode(args.input)

        obj = pickle.loads(data)
        print("[+] pickle output:")
        print(obj)

    except Exception as e:
        print(f"[!] Error during processing: {e}")

if __name__ == "__main__":
    main()
