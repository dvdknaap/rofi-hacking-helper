#!/bin/bash

: '
cmd: upload winPEAS.bat file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEAS.bat"

cmd_upload_file "${LOCATION}" "${FILE}"