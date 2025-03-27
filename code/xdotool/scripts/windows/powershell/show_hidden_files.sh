#!/bin/bash

: '
Powershell: show hidden files
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Get-ChildItem -File -Recurse -Hidden -ErrorAction SilentlyContinue"
xdotool key Return
