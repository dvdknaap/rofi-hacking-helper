#!/bin/bash

: '
ps upload LaZagne to server
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/lazagne/.files"
FILE="LaZagne.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
