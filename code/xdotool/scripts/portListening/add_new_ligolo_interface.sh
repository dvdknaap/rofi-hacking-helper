#!/bin/bash

: '
add new ligolo interface
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP / range address" "ip_range")
INTERFACE_NAME_FIELD=$(form_item  "interface name" "interface_name")

# Generate GUI form
generate_form "${IP_FIELD}" "${INTERFACE_NAME_FIELD}"

IP=${form_data["ip_range"]}
INTERFACE_NAME=${form_data["interface_name"]}

paste_command "sudo ip link delete ${INTERFACENAME}"
xdotool key Return
sleep 2

paste_command "sudo ip tuntap add user \$USER mode tun ${INTERFACENAME} && sudo ip link set ${INTERFACENAME} up && sudo ip route add ${IP} dev ${INTERFACENAME}"
xdotool key Return
