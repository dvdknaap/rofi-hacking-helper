#!/bin/bash

: '
Nmap: udp scan
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")
TOP_PORTS_FIELD=$(form_item  "top ports" "number" "top_ports" "100")

# Generate GUI form
generate_form "${IP_FIELD}" "${TOP_PORTS_FIELD}"

IP=${form_data["ip"]}
TOP_PORTS=${form_data["top_ports"]}

paste_command "sudo nmap ${IP} -sU --top-ports=${TOP_PORTS} -vvv"
xdotool key Return
