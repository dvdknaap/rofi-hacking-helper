#!/bin/bash

: '
dump git folder to local folder
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
LOCAL_FOLDER_FIELD=$(form_item "local folder" "local_foler" "./git-dump")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${LOCAL_FOLDER_FIELD}"

WEBSITE=${form_data["website"]}
LOCAL_FOLDER=${form_data["local_foler"]}

paste_command "git-dumper '${WEBSITE}' ${LOCAL_FOLDER}"
xdotool key Return
