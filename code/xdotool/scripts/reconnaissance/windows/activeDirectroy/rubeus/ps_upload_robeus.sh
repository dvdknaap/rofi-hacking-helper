#!/bin/bash

: '
ps: Upload Rubeus.exe
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/activeDirectroy/rubeus/.files"
FILE="Rubeus.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
