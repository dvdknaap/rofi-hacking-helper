#!/bin/bash

: '
cmd: upload winPEASany_ofs.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASany_ofs.exe"

cmd_upload_file "${LOCATION}" "${FILE}"