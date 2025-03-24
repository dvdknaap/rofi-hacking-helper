#!/bin/bash

: '
download winPEASx64_ofs.exe to server and execute
'

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEASx64_ofs.exe -O ${SCRIPTS_DIR}/reconnaissance/linux/.files/winPEASx64_ofs.exe

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/cmd/.files"
FILE="winPEASx64_ofs.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
sleep 3

paste_command "${FILE_LOCATION}"
xdotool key Return