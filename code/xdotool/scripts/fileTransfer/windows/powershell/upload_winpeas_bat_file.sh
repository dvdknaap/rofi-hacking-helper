#!/bin/bash

: '
ps: upload winPEAS.bat file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEAS.bat"

ps_webclient_upload_file "${LOCATION}" "${FILE}"