#!/bin/bash

: '
cmd: upload invoke-wmiexec.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Invoke-WMIExec.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
