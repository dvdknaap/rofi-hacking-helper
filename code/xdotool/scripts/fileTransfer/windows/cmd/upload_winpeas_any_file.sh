#!/bin/bash

: '
cmd: upload winPEASany.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASany.exe"

cmd_upload_file "${LOCATION}" "${FILE}"