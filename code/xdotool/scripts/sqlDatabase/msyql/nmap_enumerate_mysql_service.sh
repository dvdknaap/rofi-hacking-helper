#!/bin/bash

: '
nmap: enumerate mysql service
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
MYSQL_PORT_FIELD=$(form_item  "mysql port" "number" "mysql_port" "3306")

# Generate GUI form
generate_form "${IP_FIELD}" "${MYSQL_PORT_FIELD}"

IP=${form_data["ip"]}
MYSQL_PORT=${form_data["mysql_port"]}

paste_command "nmap ${IP} -sV -sC -p${MYSQL_PORT} --script 'mysql*'"
xdotool key Return
