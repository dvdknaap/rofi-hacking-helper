#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command="EXEC sp_configure 'show advanced options', '1';"
paste_command "${command}"
xdotool key Return


command="RECONFIGURE;"
paste_command "${command}"
xdotool key Return


command="EXEC sp_configure 'xp_cmdshell', '1';"
paste_command "${command}"
xdotool key Return


command="RECONFIGURE;"
paste_command "${command}"
xdotool key Return
