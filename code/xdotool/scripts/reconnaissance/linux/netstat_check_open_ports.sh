#!/bin/bash

: '
netstat: check for open ports
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "netstat -tpln"
