#!/bin/bash

: '
ps: download nc file
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"