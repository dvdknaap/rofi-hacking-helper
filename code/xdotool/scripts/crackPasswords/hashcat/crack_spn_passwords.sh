 #!/bin/bash

"""
Crack SPN passwords with hashcat using rockyou.txt.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "hashcat -m 13100 documentation/evidence/notes/spns.txt /usr/share/wordlists/rockyou.txt"
