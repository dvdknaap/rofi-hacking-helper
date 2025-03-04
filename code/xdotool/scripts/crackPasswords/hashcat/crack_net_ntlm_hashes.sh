 #!/bin/bash

"""
Crack NTLM hashes with hashcat using rockyou.txt.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "hashcat -m 1000 -O -w 3 hash /usr/share/wordlists/rockyou.txt"
