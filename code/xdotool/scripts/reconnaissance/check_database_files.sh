#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='for l in $(echo ".sql .sqlite .db .*db .db*");do echo -e "\nDB File extension: " $l; find / -name *$l 2>/dev/null | grep -v "doc\|lib\|headers\|share\|man";done'
paste_command "${command}"
