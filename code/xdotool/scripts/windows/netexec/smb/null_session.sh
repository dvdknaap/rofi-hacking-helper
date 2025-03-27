#!/bin/bash

: '
check if null session is possible
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

paste_command "netexec smb ${IP} -u '' -p ''"
xdotool key Return
