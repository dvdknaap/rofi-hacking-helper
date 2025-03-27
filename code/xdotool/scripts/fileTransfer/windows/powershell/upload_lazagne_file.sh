#!/bin/bash

: '
ps: upload LaZagne file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="LaZagne.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
