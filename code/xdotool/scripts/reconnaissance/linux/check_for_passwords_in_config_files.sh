#!/bin/bash


: '
search for passwords in config files: .conf, .config, .cnf
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "for i in \$(find / (-name \"*.cnf\" -o -name \"*.conf\" -o -name \"*.config\")  2>/dev/null | grep -v \"doc\|lib\");do echo -e "\nFile: " \$i; grep "user\|password\|pass" \$i 2>/dev/null | grep -v "\#";done"
