#!/bin/bash

: '
enable permission tokens
'

LOCATION="${SCRIPTS_DIR}/windows/permissions/.files"
FILE="Enable-Privilege.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

paste_command "${TMP_FOLFILE_LOCATIONDER}\EnableAllTokenPrivs.ps1"
xdotool key Return 
