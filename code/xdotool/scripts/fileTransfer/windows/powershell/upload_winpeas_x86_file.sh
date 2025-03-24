#!/bin/bash

: '
ps: upload winPEASx86.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASx86.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"