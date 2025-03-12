#!/bin/bash

: '
start python server to binary folder
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "port"

PORT=${form_data["port"]}

cd ~/Desktop/base/code/xdotool/scripts/fileTransfer/windows/.binaries
python3 -m http.server $PORT &
HTTP_PID=$!
echo "$HTTP_PID"

paste_command "# use \`kill ${HTTP_PID}\` to kill the server; use http://${KALI_IP}:${PORT} to download files"