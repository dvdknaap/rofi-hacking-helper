#!/bin/bash

: '
script to enable xp_cmdshell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "EXEC sp_configure 'show advanced options', '1';"
xdotool key Return
sleep 1

paste_command "RECONFIGURE;"
xdotool key Return
sleep 1


paste_command "EXEC sp_configure 'xp_cmdshell', '1';"
xdotool key Return
sleep 1


paste_command "RECONFIGURE;"
xdotool key Return
sleep 1