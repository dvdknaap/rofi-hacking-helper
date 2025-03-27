#!/bin/bash

: '
cmd: upload PrintSpoofer file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="PrintSpoofer.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
