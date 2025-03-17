#!/bin/bash

: '
search for config files: .conf, .config, .cnf
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh


paste_command "for l in \$(echo ".conf .config .cnf");do echo -e "\nFile extension: " \$l; find / -name *\$l 2>/dev/null | grep -v "lib\|fonts\|share\|core" ;done"
