#!/bin/bash

: '
ps: upload nc64 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc64.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"