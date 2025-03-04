#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='for i in $(find / (-name "*.cnf" -o -name "*.conf" -o -name "*.config")  2>/dev/null | grep -v "doc\|lib");do echo -e "\nFile: " $i; grep "user\|password\|pass" $i 2>/dev/null | grep -v "\#";done'
paste_command "${command}"
