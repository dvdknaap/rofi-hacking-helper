#!/bin/bash

: '
Powershell: search for a file or extension
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file" "*7z")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["file"]}

paste_command "\Get-ChildItem -Recurse -Include ${FILE} -ErrorAction SilentlyContinue -File"
xdotool key Return
sleep 0.8
