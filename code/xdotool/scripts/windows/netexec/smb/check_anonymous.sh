#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "netexec smb 10.10.10.1 -u 'a' -p '' --shares"
