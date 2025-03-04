#!/bin/bash

"""
Start socks proxy
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "use auxiliary/server/socks_proxy"
xdotool key Return
sleep 1

paste_command "set SRVPORT 9050"
xdotool key Return
sleep 1

paste_command "set VERSION 5"
xdotool key Return
sleep 1

paste_command "run"
