#!/bin/bash

: '
cmd: upload winPEASx86.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASx86.exe"

cmd_upload_file "${LOCATION}" "${FILE}"