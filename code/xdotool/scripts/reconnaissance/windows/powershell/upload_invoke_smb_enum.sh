#!/bin/bash

: '
ps: upload invoke-smbenum.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Invoke-SMBEnum.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "Import-Module ${FILE_LOCATION}"
create_new_line

