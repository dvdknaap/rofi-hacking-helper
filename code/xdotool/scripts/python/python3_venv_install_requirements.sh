#!/bin/bash

: '
python3 venv install requirements.txt
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
VENV_FOLDER_FIELD=$(form_item  "venv folder" "venv_folder" ".venv")

# Generate GUI form
generate_form "${VENV_FOLDER_FIELD}"

VENV_FOLDER=${form_data["venv_folder"]}

execute_command "${VENV_FOLDER}/bin/pip3 install -r requirements.txt"
create_new_line
