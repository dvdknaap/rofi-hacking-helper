#!/bin/bash

: '
search text files in /home: .txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "find /home/* -type f -name "*.txt" -o ! -name "*.*""
