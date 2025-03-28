#!/bin/bash

: '
remove ligolo interface
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
INTERFACE_NAME_FIELD=$(form_item  "interface name" "interface_name")

# Generate GUI form
generate_form "${INTERFACE_NAME_FIELD}"

INTERFACE_NAME=${form_data["interface_name"]}

paste_command "sudo ip link delete ${INTERFACE_NAME}"
xdotool key Return