#!/bin/bash

: '
Nmap: scan for vulnerabilities
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")
PORT_FIELD=$(form_item  "port" "number" "port" "80")

# Generate GUI form
generate_form "${IP_FIELD}" "${PORT_FIELD}"

IP=${form_data["ip"]}
PORT=${form_data["port"]}

paste_command "nmap ${IP} -p ${PORT} -sV --script vuln -vvv"
xdotool key Return
