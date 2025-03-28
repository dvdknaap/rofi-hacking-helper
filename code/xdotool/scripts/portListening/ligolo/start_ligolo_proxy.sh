#!/bin/bash

: '
configure ligolo interface and start proxy
'

PROXY_LOCATION="${SCRIPTS_DIR}/portListening/ligolo/.files/proxy"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP or range address" "ip_range")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip_range"]}
INTERFACENAME="ligolo"

paste_command "sudo ip link delete ${INTERFACENAME}"
xdotool key Return
sleep 2

paste_command "sudo ip tuntap add user \$USER mode tun ${INTERFACENAME} && sudo ip link set ${INTERFACENAME} up && sudo ip route add ${IP} dev ${INTERFACENAME}"
xdotool key Return
sleep 2

paste_command "${PROXY_LOCATION} -selfcert"
xdotool key Return
