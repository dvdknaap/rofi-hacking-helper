#!/bin/bash

: '
search for group policies in downloaded folders
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "find . -iname Groups.xml 2> /dev/null"
xdotool key Return