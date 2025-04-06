#!/bin/bash

: '
ps: Upload powerview and execute
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/activeDirectroy/powerVIew/.files"
FILE="powerview.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

execute_command "Import-Module ${FILE_LOCATION}"
create_new_line
