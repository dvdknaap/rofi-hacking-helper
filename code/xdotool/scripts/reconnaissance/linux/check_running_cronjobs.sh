#!/bin/bash

: '
download pspy64 to server and run it
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/linux/.files"
FILE="pspy64"

curl_upload_file "${LOCATION}" "${FILE}"
sleep 3

paste_command "${FILE_LOCATION} -pf -i 1000"
xdotool key Return