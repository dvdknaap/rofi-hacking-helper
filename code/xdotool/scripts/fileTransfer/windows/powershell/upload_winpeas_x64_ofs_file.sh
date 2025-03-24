#!/bin/bash

: '
ps: upload winPEASx64_ofs.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASx64_ofs.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"