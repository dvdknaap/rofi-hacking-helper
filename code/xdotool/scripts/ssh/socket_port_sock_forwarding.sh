#!/bin/bash

: '
-D sock 5 forwarding
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item "IP address" "ip")
USERNAME_FIELD=$(form_item "username" "text" "username" "root")
PROXY_PORT_FIELD=$(form_item "proxy port" "number" "proxy_port" "9050")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PROXY_PORT_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PROXY_PORT=${form_data["proxy_port"]}

paste_command "ssh -D ${PROXY_PORT} ${USERNAME}@${IP} -v"
xdotool key Return