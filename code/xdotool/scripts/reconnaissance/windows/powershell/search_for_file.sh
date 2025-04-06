#!/bin/bash

: '
Powershell: search for a file or extension
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file" "*7z")
PATH_FIELD=$(form_item  "path" "path" "c:\\")

# Generate GUI form
generate_form "${FILE_FIELD}" "${PATH_FIELD}"

FILE=${form_data["file"]}
PATH=${form_data["path"]}

execute_command "Get-ChildItem -Recurse -Include \"${FILE}\" -Path \"${PATH}\" -ErrorAction SilentlyContinue -File"
create_new_line
