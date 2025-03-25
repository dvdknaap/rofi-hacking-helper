#!/bin/bash

: '
cmd: upload winPEASx86_ofs.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASx86_ofs.exe"

cmd_upload_file "${LOCATION}" "${FILE}"