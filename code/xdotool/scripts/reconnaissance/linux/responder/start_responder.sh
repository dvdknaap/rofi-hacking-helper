#!/bin/bash

: '
start responder
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
INTERFACE_NAME_FIELD=$(form_item  "interface name" "interface_name" "tun0")

# Generate GUI form
generate_form "${INTERFACE_NAME_FIELD}"

INTERFACE_NAME=${form_data["interface_name"]}

execute_command "sudo responder -I ${INTERFACE_NAME} -v"
create_new_line
