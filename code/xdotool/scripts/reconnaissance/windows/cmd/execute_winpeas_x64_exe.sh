#!/bin/bash

: '
download winPEASx64.exe to server and execute
'

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEASx64.exe -O ${SCRIPTS_DIR}/reconnaissance/linux/.files/winPEASx64.exe

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/cmd/.files"
FILE="winPEASx64.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
sleep 3

paste_command "${FILE_LOCATION}"
xdotool key Return