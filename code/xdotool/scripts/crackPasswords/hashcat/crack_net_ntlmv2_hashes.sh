 #!/bin/bash

: '
Crack NetNTLMv2 hashes with hashcat using rockyou.txt.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "hashcat -m 5600 -O -w 3 hash /usr/share/wordlists/rockyou.txt"
