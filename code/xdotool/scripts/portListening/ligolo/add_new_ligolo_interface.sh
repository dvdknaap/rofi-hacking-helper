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

execute_command "sudo ip link delete ${INTERFACENAME}"
create_new_line
sleep 2

execute_command "sudo ip tuntap add user \$USER mode tun ${INTERFACENAME} && sudo ip link set ${INTERFACENAME} up && sudo ip route add ${IP} dev ${INTERFACENAME}"
create_new_line
