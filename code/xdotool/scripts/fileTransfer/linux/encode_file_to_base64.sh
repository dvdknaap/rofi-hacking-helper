#!/bin/bash

: '
encode file to base64 string
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item "file" "file" "id_rsa")

# Generate GUI form
generate_form "${FILE_FIELD}" 

FILE=${form_data["file"]}

execute_command "cat ${FILE} |base64 -w 0;echo"
create_new_line
sleep 0.8

execute_command "md5sum ${FILE}"
create_new_line
