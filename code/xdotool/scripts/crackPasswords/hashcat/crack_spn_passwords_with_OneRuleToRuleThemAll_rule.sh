 #!/bin/bash

: '
Crack SPN passwords with hashcat using rockyou.txt and OneRuleToRuleThemAll.rule.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "hashcat -m 13100 -O -w 3 documentation/evidence/notes/spns.txt /usr/share/wordlists/rockyou.txt -r ~/Desktop/base/code/xdotool/scripts/crackPasswords/hashcat/.rules/OneRuleToRuleThemAll.rule"
