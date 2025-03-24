#!/bin/bash

: '
download winPEAS.bat to server and execute
'

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/winPEAS.bat -O ${SCRIPTS_DIR}/reconnaissance/linux/.files/winPEAS.bat

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/cmd/.files"
FILE="winPEAS.bat"

cmd_upload_file "${LOCATION}" "${FILE}"