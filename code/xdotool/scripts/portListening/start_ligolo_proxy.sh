#!/bin/bash

: '
configure ligolo interface and start proxy
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}
INTERFACENAME="ligolo"

paste_command "sudo ip link delete ${INTERFACENAME}"
xdotool key Return
sleep 2

paste_command "sudo ip tuntap add user \$USER mode tun ${INTERFACENAME} && sudo ip link set ${INTERFACENAME} up && sudo ip route add ${IP} dev ${INTERFACENAME}"
xdotool key Return
sleep 2

paste_command "${SCRIPTS_DIR}/portListening/.files/proxy -selfcert"
xdotool key Return