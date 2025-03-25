#!/bin/bash

: '
cmd: upload winPEASx64_ofs.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASx64_ofs.exe"

cmd_upload_file "${LOCATION}" "${FILE}"