#!/bin/bash

: '
enable permission tokens
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/permissions/.files"
FILE="Enable-Privilege.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

execute_command "${TMP_FOLFILE_LOCATIONDER}\EnableAllTokenPrivs.ps1"
create_new_line 
