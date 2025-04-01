#!/bin/bash

: '
get default credentials of program
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PROGRAM_NAME_FIELD=$(form_item  "program name" "program_name")

# Generate GUI form
generate_form "${PROGRAM_NAME_FIELD}"

PROGRAM_NAME=${form_data["program_name"]}

execute_command "creds search ${PROGRAM_NAME}"
create_new_line
