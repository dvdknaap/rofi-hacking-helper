#!/bin/bash

: '
klist: get info of file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["file"]}

execute_command "klist -k -t ${FILE}"
create_new_line
