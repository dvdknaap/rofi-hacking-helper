#!/bin/bash

: '
FTP: login with username and password
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

FILES_FOLDER="${SCRIPTS_DIR}/ftp/.files"

# Define replacement fields
REPLACE_FIELDS=(
    "[IP]" "${IP}"
    "[USERNAME]" "${USERNAME}"
    "[PASSWORD]" "${PASSWORD}"
)

find_and_replace_file "${FILES_FOLDER}" "user_login.txt" "${REPLACE_FIELDS[@]}"

paste_command "ftp -v -n -s:${TMP_FILE} ${IP}"
xdotool key Return
