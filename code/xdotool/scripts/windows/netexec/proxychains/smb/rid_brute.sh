#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "proxychains netexec smb 192.168.215.104 -u 'user' -p 'PASS' --rid-brute"
