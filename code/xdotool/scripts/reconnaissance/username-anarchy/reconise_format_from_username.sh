#!/bin/bash

: '
recognise format from username
'

PROGRAM_PATH="${SCRIPTS_DIR}/reconnaissance/username-anarchy/.files/username-anarchy"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERNAME_FIELD=$(form_item  "username" "username")

# Generate GUI form
generate_form "${USERNAME_FIELD}"

USERNAME=${form_data["username"]}

execute_command "${PROGRAM_PATH} --recognise '${USERNAME}'"
create_new_line
