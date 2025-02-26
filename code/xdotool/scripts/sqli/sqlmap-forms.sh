#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='sqlmap -u http://ip --forms --level 5 --risk 3 --batch'
paste_command "${command}"
