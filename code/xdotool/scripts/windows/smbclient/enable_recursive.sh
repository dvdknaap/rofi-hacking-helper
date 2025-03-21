#!/bin/bash

: '
smbclient: enable recursive
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "RECURSE ON"
xdotool key Return