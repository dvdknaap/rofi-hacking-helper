#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='for l in $(echo ".conf .config .cnf");do echo -e "\nFile extension: " $l; find / -name *$l 2>/dev/null | grep -v "lib\|fonts\|share\|core" ;done'
paste_command "${command}"
