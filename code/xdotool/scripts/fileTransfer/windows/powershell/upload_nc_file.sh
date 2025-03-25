#!/bin/bash

: '
ps: upload nc file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"