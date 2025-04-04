#!/bin/bash

: '
ping sweep - check if ips are alive in ip range 0.0.0
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_RANGE_FIELD=$(form_item  "Ip range" "ip" "10.10.10")

# Generate GUI form
generate_form "${IP_RANGE_FIELD}"

IP_RANGE=${form_data["ip"]}

execute_command "for i in \$(seq 254); do ping ${IP_RANGE}.\$i -c1 -W1 & done | grep from"
