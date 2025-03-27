#!/bin/bash

: '
ps: upload PrintSpoofer file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="PrintSpoofer.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
