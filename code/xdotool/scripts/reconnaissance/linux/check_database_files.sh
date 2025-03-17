#!/bin/bash

: '
search for database files: .sql, .sqlite, .db
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "for l in $(echo ".sql .sqlite .db .*db .db*");do echo -e "\nDB File extension: " $l; find / -name *$l 2>/dev/null | grep -v "doc\|lib\|headers\|share\|man";done"