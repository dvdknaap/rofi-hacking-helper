#!/bin/bash

: '
nmap: check for smtp open relay
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

execute_command "nmap ${IP} -p25 --script smtp-open-relay -v"
create_new_line
