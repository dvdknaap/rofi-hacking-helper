#!/bin/bash

: '
Start socks proxy
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Port" "Version"

PORT=${form_data["Port"]}
VERSION=${form_data["Version"]}

paste_command "use auxiliary/server/socks_proxy"
xdotool key Return
sleep 1

paste_command "set SRVPORT ${PORT}"
xdotool key Return
sleep 1

paste_command "set VERSION ${VERSION}"
xdotool key Return
sleep 1

paste_command "run"
