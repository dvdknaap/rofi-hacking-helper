#!/bin/bash

: '
configure ligolo interface and start proxy
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip range"

IPRANGE=${form_data["Ip range"]}

paste_command "sudo ip tuntap add user \$USER mode tun ligolo && sudo ip link set ligolo up && sudo ip route add ${IPRANGE} dev ligolo"
xdotool key Return
sleep 2

paste_command "/opt/tools/ligolo-ng_proxy_*linux_amd64/proxy -selfcert"