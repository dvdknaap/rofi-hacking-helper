#!/bin/bash

: '
download linpeas to server and execute
'

# wget https://github.com/peass-ng/PEASS-ng/releases/latest/download/linpeas.sh -O ${SCRIPTS_DIR}/reconnaissance/linux/.files/linpeas.sh

LOCATION="${SCRIPTS_DIR}/reconnaissance/linux/.files"
FILE="linpeas.sh"

curl_upload_file "${LOCATION}" "${FILE}"
sleep 3

paste_command " bash ${FILE_LOCATION}"
xdotool key Return