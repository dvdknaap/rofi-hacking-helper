 #!/bin/bash

: '
Create sorted, unique wordlist: rockyou.txt + OneRuleToRuleThemAll.rule.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "hashcat --force /usr/share/wordlists/rockyou.txt -r /home/kali/Desktop/base/code/xdotool/scripts/crackPasswords/hashcat/.rules/OneRuleToRuleThemAll.rule --stdout | sort -u > hashcat_rockyou_best64_wordlist.txt"
