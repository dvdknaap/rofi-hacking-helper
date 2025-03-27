#!/bin/bash

: '
ps: Upload Inveigh.ps1 and import module
'

LOCATION="${SCRIPTS_DIR}/windows/inveight/.files"
FILE="Inveigh.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

paste_command "Import-Module ${FILE_LOCATION}"
xdotool key Return
