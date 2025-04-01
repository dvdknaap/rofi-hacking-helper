#!/bin/bash

: '
meterpreter: set server routes
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_RANGE_FIELD=$(form_item  "IP range" "ip_range")

# Generate GUI form
generate_form "${REMOTE_PORT_FIELD}" 

IP_RANGE=${form_data["ip_range"]}

execute_command "run autoroute -s ${IP_RANGE}"
create_new_line
