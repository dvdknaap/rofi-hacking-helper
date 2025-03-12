 #!/bin/bash

: '
Crack Kerberos 5, etype 23, AS-REP hashes with hashcat using rockyou.txt.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "hashcat -m 18200 -O -w 3 hash /usr/share/wordlists/rockyou.txt"
