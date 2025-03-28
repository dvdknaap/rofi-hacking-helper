#!/bin/bash

: '
onesixtyone: get public info of server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

paste_command "onesixtyone -c /usr/share/seclists/Discovery/SNMP/snmp.txt ${IP}"
xdotool key Return
