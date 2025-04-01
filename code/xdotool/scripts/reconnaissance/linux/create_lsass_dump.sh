#!/bin/bash

: '
Powershell: create lsass.dump in elevated powershell
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LSASS_DMP_FILE_FIELD=$(form_item  "LSASS dump file" "lsass_dump_file")

# Generate GUI form
generate_form "${LSASS_DMP_FILE_FIELD}"

LSASS_DMP=${form_data["lsass_dump_file"]}

execute_command "pypykatz lsa minidump ${LSASS_DMP}"
create_new_line
