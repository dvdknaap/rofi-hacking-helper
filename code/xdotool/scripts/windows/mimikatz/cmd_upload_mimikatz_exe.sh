#!/bin/bash

: '
cmd: upload mimikatz to server
'

LOCATION="${SCRIPTS_DIR}/windows/mimikatz/.files"
FILE="mimikatz.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
