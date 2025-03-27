#!/bin/bash

: '
Copy PowerView.ps1 from shared drive
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "copy \\TSCLIENT\tools\PowerView.ps1 C:\temp\PowerView.ps1"
xdotool key Return
