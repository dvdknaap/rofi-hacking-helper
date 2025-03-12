#!/bin/bash

: '
configure ligolo interface and start proxy
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip range" "Interface name"

IPRANGE=${form_data["Ip range"]}
INTERFACENAME=${form_data["Interface name"]}

paste_command "sudo ip tuntap add user \$USER mode tun ${INTERFACENAME} && sudo ip link set ${INTERFACENAME} up && sudo ip route add ${IPRANGE} dev ${INTERFACENAME}"
xdotool key Return
sleep 2