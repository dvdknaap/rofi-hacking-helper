#!/bin/bash

: '
script to read directories with xp_dirtree
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DIRECTORY_FIELD=$(form_item  "Directory" "directory")

# Generate GUI form
generate_form "${DIRECTORY_FIELD}"

DIRECTORY=${form_data["directory"]}

paste_command "xp_dirtree ${DIRECTORY}"
xdotool key Return