#!/bin/bash

: '
Loop over de ad_users and get AD rights
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "foreach(\$line in [System.IO.File]::ReadLines(\"c:\temp\ad_users.txt\")) {get-acl \"AD:\$(Get-ADUser \$line)\" }"
xdotool key Return