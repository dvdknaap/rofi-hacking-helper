#!/bin/bash

: '
smbclient: download files recursive
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "PROMPT OFF"
xdotool key Return
sleep 0.8

paste_command "RECURSE ON"
xdotool key Return
sleep 0.8

paste_command "mget *"
xdotool key Return