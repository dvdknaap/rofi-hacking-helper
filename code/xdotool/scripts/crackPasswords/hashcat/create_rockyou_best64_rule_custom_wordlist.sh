 #!/bin/bash

: '
Create sorted, unique wordlist from rockyou.txt + best64.rule.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "hashcat --force /usr/share/wordlists/rockyou.txt -r /usr/share/hashcat/rules/best64.rule --stdout | sort -u > hashcat_rockyou_best64_wordlist.txt"
