#!/bin/bash

: '
decode base64 string and save to file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item "file" "file" "id_rsa")
BASE64_FILE_STRING_FIELD=$(form_item "base64 file string" "base64_file_string")

# Generate GUI form
generate_form "${FILE_FIELD}" "${BASE64_FILE_STRING_FIELD}" 

FILE=${form_data["file"]}
BASE64_FILE_STRING=${form_data["base64_file_string"]}

paste_command "echo -n '${BASE64_FILE_STRING}' | base64 -d > ${FILE}"
xdotool key Return
sleep 0.8

paste_command "md5sum ${FILE}"
xdotool key Return
