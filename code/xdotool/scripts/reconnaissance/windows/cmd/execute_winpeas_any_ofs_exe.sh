#!/bin/bash

: '
download winPEASany_ofs.exe to server and execute
'

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEASany_ofs.exe -O ${SCRIPTS_DIR}/reconnaissance/linux/.files/winPEASany_ofs.exe

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/cmd/.files"
FILE="winPEASany_ofs.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "${FILE_LOCATION}"
create_new_line
