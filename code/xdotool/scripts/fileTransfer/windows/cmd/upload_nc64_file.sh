#!/bin/bash

: '
cmd: upload nc64 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc64.exe"

cmd_upload_file "${LOCATION}" "${FILE}"