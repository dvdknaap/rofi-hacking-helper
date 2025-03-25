#!/bin/bash

: '
cmd: upload winPEASx64.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASx64.exe"

cmd_upload_file "${LOCATION}" "${FILE}"