 #!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "hashcat -m 13100 documentation/evidence/notes/spns.txt /usr/share/wordlists/rockyou.txt -r /home/kali/Desktop/base/code/xdotool/scripts/crackPasswords/hashcat/.rules/OneRuleToRuleThemAll.rule"
