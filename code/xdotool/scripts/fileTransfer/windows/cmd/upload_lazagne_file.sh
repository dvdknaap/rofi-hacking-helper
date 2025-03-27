#!/bin/bash

: '
cmd: upload LaZagne file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="LaZagne.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
