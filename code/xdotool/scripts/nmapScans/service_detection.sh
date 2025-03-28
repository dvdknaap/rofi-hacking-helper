#!/bin/bash

: '
Nmap: scan for services
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

paste_command "nmap ${IP} -p- -sV -vvv"
xdotool key Return
