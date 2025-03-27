#!/bin/bash

: '
cmd: upload LaZagne file to server
'

LOCATION="${SCRIPTS_DIR}/windows/lazagne/.files"
FILE="LaZagne.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
