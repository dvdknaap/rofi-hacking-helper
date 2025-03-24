#!/bin/bash

: '
local port scan on ip
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}" "${INTERFACE_NAME_FIELD}"

IP=${form_data["ip"]}

paste_command "for PORT in {0..1000}; do timeout 1 bash -c \"</dev/tcp/${IP}/\$PORT &>/dev/null\" 2>/dev/null && echo \"port \$PORT is open\"; done"
xdotool key Return