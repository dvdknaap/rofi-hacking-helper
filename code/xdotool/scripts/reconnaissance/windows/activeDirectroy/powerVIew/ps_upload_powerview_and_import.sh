#!/bin/bash

: '
ps: Upload sharphound and execute
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/activeDirectroy/rubeus/.files"
FILE="powerview.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

paste_command "Import-Module ${FILE_LOCATION}"
xdotool key Return
