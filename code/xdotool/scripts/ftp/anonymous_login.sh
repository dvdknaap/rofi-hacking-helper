#!/bin/bash

: '
FTP: check for anonymous login
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}
USERNAME="anonymous"
PASSWORD="anonymous"

FILES_FOLDER="${SCRIPTS_DIR}/ftp/.files"

# Define replacement fields
REPLACE_FIELDS=(
    "[IP]" "${IP}"
    "[USERNAME]" "${USERNAME}"
    "[PASSWORD]" "${PASSWORD}"
)

find_and_replace_file "${FILES_FOLDER}" "user_login.txt" "${REPLACE_FIELDS[@]}"

paste_command "ftp -v -n < ${TMP_FILE}"
xdotool key Return

