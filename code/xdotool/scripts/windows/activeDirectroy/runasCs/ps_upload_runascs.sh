#!/bin/bash

: '
ps: Upload RunasCs.exe
'
LOCATION="${SCRIPTS_DIR}/windows/activeDirectroy/runasCs/.files"
FILE="SharpGPOAbuse.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
