#!/bin/bash

: '
cmd: upload nc file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc.exe"

cmd_upload_file "${LOCATION}" "${FILE}"