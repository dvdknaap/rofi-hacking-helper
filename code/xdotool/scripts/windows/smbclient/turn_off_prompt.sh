#!/bin/bash

: '
smbclient: turn off prompt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "PROMPT OFF"
xdotool key Return