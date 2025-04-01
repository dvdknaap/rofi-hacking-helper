#!/bin/bash

: '
cmd: upload invoke-smbclient.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Invoke-SMBClient.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
