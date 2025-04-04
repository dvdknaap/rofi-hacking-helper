#!/bin/bash

: '
ps: execute sharphound
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
ZIP_FILENAME_FIELD=$(form_item  "zip filename" "zip_filename")

# Generate GUI form
generate_form "${ZIP_FILENAME_FIELD}"

ZIP_FILENAME=${form_data["zip_filename"]}

execute_command "SharpHound.exe -c All --zipfilename ${ZIP_FILENAME}"
create_new_line

kill $HTTP_PID
