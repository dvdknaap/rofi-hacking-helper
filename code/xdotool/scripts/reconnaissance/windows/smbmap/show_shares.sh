#!/bin/bash

: '
smbmap: show shares.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

execute_command "smbmap -H ${IP}"
create_new_line
