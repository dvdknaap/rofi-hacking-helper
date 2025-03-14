#!/bin/bash

: '
add new ligolo interface
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip" "interface name"

IP=${form_data["Ip"]}
INTERFACENAME=${form_data["interface name"]}

paste_command "sudo ip link delete ${INTERFACENAME}"
xdotool key Return
sleep 2

paste_command "sudo ip tuntap add user \$USER mode tun ${INTERFACENAME} && sudo ip link set ${INTERFACENAME} up && sudo ip route add ${IP} dev ${INTERFACENAME}"
xdotool key Return