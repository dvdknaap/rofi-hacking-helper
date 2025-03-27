#!/bin/bash

: '
Copy file from shared drive
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file" "\tools\PowerView.ps1")
LOCATION_FIELD=$(form_item  "location" "location" ".\PowerView.ps1")

# Generate GUI form
generate_form "${FILE_FIELD}" "${LOCATION_FIELD}"

FILE=${form_data["file"]}
LOCATION=${form_data["location"]}

paste_command "copy \\\TSCLIENT${FILE} ${LOCATION}"
xdotool key Return
