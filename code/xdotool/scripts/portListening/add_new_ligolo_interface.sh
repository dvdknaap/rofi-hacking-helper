#!/bin/bash

: '
add new ligolo interface in proxy
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip range" "Interface name"

IPRANGE=${form_data["Ip range"]}
INTERFACENAME=${form_data["Interface name"]}

paste_command "nterface_add_route --name ${INTERFACENAME} --route ${IPRANGE}"
xdotool key Return
sleep 2