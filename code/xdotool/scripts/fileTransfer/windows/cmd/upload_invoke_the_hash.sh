#!/bin/bash

: '
cmd: upload invoke-thehash.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Invoke-TheHash.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
