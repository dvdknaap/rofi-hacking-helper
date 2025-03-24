#!/bin/bash

: '
ps: upload winPEASany.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASany.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"