#!/bin/bash

: '
cmd: upload invoke-smbenum.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/cmd/.files"
FILE="Invoke-SMBEnum.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "Import-Module ${FILE_LOCATION}"
create_new_line
