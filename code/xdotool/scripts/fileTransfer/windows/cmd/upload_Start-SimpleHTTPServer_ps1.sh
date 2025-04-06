#!/bin/bash

: '
cmd: upload Start-SimpleHTTPServer.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Start-SimpleHTTPServer.ps1"

cmd_upload_file "${LOCATION}" "${FILE}"
