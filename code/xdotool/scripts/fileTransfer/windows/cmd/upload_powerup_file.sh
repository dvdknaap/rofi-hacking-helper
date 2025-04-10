#!/bin/bash

: '
cmd: upload powerup.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="powerup.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
