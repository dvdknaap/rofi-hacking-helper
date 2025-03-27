#!/bin/bash

: '
search for group policies in downloaded folders
'

paste_command "find . -iname Groups.xml 2> /dev/null"
xdotool key Return
