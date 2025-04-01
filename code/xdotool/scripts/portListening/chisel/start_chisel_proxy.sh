#!/bin/bash

: '
start chisel proxy
'

PROXY_LOCATION="${SCRIPTS_DIR}/portListening/chisel/.files/chisel"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PROXY_PORT_FIELD=$(form_item  "proxy port" "number" "proxy_port" "9999")

# Generate GUI form
generate_form "${PROXY_PORT_FIELD}"

PROXY_PORT=${form_data["proxy_port"]}
 
execute_command "${PROXY_LOCATION} server -p ${PROXY_PORT} --reverse"
create_new_line
