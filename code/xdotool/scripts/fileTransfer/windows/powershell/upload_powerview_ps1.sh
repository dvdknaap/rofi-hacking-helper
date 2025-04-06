#!/bin/bash

: '
ps: upload powerview.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="powerview.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
