#!/bin/bash

: '
download winPEASx86_ofs.exe to server and execute
'

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEASx86_ofs.exe -O ${SCRIPTS_DIR}/reconnaissance/linux/.files/winPEASx86_ofs.exe

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/cmd/.files"
FILE="winPEASx86_ofs.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
sleep 3

paste_command "${FILE_LOCATION}"
xdotool key Return