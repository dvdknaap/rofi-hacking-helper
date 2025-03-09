#!/bin/bash

: '
check for SUID, check gtfobins for something usefull
'
source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "find / -perm -4000 2>/dev/null"
