#!/bin/bash

: '
python3: create venv env folder
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
VENV_FOLDER_FIELD=$(form_item  "venv folder" "venv_folder" ".venv")

# Generate GUI form
generate_form "${VENV_FOLDER_FIELD}"

VENV_FOLDER=${form_data["venv_folder"]}

execute_command "python3 -m venv ${VENV_FOLDER}"
create_new_line
