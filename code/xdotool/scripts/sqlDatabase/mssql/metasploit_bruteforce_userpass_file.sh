#!/bin/bash

: '
msfconsole: start mssql ping
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
RHOSTS_FIELD=$(form_item  "RHOSTS" "RHOSTS")

# Generate GUI form
generate_form "${RHOSTS_FIELD}"

RHOSTS=${form_data["RHOSTS"]}

FILES_FOLDER="${SCRIPTS_DIR}/sqlDatabase/mssql/.files"

# Define replacement fields
REPLACE_FIELDS=(
    "[RHOSTS]" "${RHOSTS}"
)

find_and_replace_file "${FILES_FOLDER}" "msfconsole_mssql_ping.rc" "${REPLACE_FIELDS[@]}"

paste_command "msfconsole -r ${TMP_FILE}"
xdotool key Return
