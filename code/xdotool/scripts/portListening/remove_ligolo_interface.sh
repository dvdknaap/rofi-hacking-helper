#!/bin/bash

: '
remove ligolo interface
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip range" "Interface name"

IPRANGE=${form_data["Ip range"]}
INTERFACENAME=${form_data["Interface name"]}

paste_command "sudo ip link delete ${INTERFACENAME}"
xdotool key Return