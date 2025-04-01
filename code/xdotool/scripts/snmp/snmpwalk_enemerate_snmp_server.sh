#!/bin/bash

: '
snmpwalk: get public info of server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

execute_command "snmpwalk -v2c -c public ${IP}"
create_new_line
