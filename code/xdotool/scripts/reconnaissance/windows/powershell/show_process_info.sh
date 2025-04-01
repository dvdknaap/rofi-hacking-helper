#!/bin/bash

: '
Powershell: show process info
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PROCESS_NAME_FIELD=$(form_item  "process name" "process_name")

# Generate GUI form
generate_form "${PROCESS_NAME_FIELD}"

PROCESS_NAME=${form_data["process_name"]}

execute_command "Get-Process ${PROCESS_NAME}"
create_new_line
