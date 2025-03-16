#!/bin/bash

: '
Powershell: show hidden directories
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Get-ChildItem -Directory -Recurse -Hidden -ErrorAction SilentlyContinue"
xdotool key Return
