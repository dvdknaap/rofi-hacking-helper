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

execute_command "sudo ip link delete ${INTERFACENAME}"
create_new_line
sleep 2

execute_command "sudo ip tuntap add user \$USER mode tun ${INTERFACENAME} && sudo ip link set ${INTERFACENAME} up && sudo ip route add ${IP} dev ${INTERFACENAME}"
create_new_line
sleep 2

execute_command "${PROXY_LOCATION} -selfcert"
create_new_line
