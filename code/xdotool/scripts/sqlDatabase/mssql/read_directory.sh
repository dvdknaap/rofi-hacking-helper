#!/bin/bash

: '
script to read directories with xp_dirtree
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DIRECTORY_FIELD=$(form_item  "Directory" "directory")

# Generate GUI form
generate_form "${DIRECTORY_FIELD}"

DIRECTORY=${form_data["directory"]}

execute_command "xp_dirtree ${DIRECTORY}"
create_new_line
