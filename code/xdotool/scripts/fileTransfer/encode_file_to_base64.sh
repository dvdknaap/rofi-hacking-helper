#!/bin/bash

: '
upload base64 file to upload server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item "file" "file" "id_rsa")

# Generate GUI form
generate_form "${LISTEN_PORT_FIELD}" "${UPLOAD_FILE_LOCATION_FIELD}" 

FILE=${form_data["file"]}

paste_command "cat ${FILE} |base64 -w 0;echo"
xdotool key Return
sleep 0.8

paste_command "md5sum ${FILE}"
xdotool key Return
