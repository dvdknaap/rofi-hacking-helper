#!/bin/bash

: '
cmd: upload invoke-smbexec.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Invoke-SMBExec.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
