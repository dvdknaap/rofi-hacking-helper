#!/bin/bash

: '
Run Snaffler on inlanefreight.local domain.
'


source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Snaffler.exe -s -d inlanefreight.local -o snaffler.log -v data"
