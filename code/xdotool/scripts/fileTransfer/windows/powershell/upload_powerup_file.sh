#!/bin/bash

: '
ps: upload powerup.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="powerup.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
