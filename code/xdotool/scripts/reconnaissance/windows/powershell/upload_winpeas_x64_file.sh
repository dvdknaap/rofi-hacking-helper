#!/bin/bash

: '
ps: upload winPEASx64.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASx64.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "${FILE_LOCATION}"
create_new_line
