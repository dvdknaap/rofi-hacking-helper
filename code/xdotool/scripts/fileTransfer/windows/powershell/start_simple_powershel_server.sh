#!/bin/bash

: '
Powershell: start simple http server and use current folder as root
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
HTTP_PORT_FIELD=$(form_item  "http port" "http_port" "1234")

# Generate GUI form
generate_form "${HTTP_PORT_FIELD}"

HTTP_PORT=${form_data["http_port"]}

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Start-SimpleHTTPServer.ps1"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "Import-Module ${FILE_LOCATION}"
create_new_line
sleep 0.8

execute_command "Start-SimpleHTTPServer -Port ${HTTP_PORT}"
create_new_line
