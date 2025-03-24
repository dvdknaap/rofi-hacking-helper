#!/bin/bash

: '
type ssh port listening
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item "IP address" "ip")
USERNAME_FIELD=$(form_item "username" "text" "username" "root")
LOCAL_PORT_FIELD=$(form_item "local port" "number" "local_port" "")
REMOTE_IP_FIELD=$(form_item "remote ip" "remote_ip" "127.0.0.1")
REMOTE_PORT_FIELD=$(form_item "remote port" "number" "remote_port" "")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${LOCAL_PORT_FIELD}" "${REMOTE_IP_FIELD}" "${REMOTE_PORT_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
LOCAL_PORT=${form_data["local_port"]}
REMOTE_IP=${form_data["remote_ip"]}
REMOTE_PORT=${form_data["remote_port"]}

paste_command "ssh -L ${LOCAL_PORT}:${REMOTE_IP}:${REMOTE_PORT} ${USERNAME}@${IP} -v"
xdotool key Return

