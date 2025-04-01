#!/bin/bash

: '
cmd: upload invoke-smbenum.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Invoke-SMBEnum.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
