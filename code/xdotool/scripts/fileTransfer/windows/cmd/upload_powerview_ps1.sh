#!/bin/bash

: '
cmd: upload powerview.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="powerview.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
