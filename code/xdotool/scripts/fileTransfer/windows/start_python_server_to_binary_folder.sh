#!/bin/bash

: '
start python server to binary folder
'
location="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item "Python HTTP port" "port")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

start_python_server "${location}" "${PORT}" "0"

paste_command "# use \`kill ${HTTP_PID}\` to kill the server; use http://${KALI_IP}:${PORT} to download files"
xdotool key Return