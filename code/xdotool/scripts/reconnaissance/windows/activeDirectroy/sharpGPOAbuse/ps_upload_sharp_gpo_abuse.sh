#!/bin/bash

: '
ps: Upload sharpGPOAbuse
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/activeDirectroy/sharpGPOAbuse/.files"
FILE="SharpGPOAbuse.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
