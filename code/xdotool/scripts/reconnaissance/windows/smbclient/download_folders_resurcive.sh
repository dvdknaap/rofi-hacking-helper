#!/bin/bash

: '
smbclient: download files recursive
'

paste_command "PROMPT OFF"
xdotool key Return
sleep 0.8

paste_command "RECURSE ON"
xdotool key Return
sleep 0.8

paste_command "mget *"
xdotool key Return
