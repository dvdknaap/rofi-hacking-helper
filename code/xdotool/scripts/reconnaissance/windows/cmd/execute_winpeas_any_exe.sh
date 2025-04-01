#!/bin/bash

: '
download winPEASany.exe to server and execute
'

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEASany.exe -O ${SCRIPTS_DIR}/reconnaissance/linux/.files/winPEASany.exe

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/cmd/.files"
FILE="winPEASany.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "${FILE_LOCATION}"
create_new_line
