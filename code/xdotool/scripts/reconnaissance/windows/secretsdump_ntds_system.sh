#!/bin/bash

: '
secretsdump: dump secrets with ntds and system.save file.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
NTDS_FILE_FIELD=$(form_item "ntds file" "ntds_file" "ntds.dit")
SYSTEM_FILE_FIELD=$(form_item "system file" "system_file" "system.save")
OUTPUT_FILE_FIELD=$(form_item "output file (optional)" "output_file" "ntlm-extract")

# Generate GUI form
generate_form "${NTDS_FILE_FIELD}" "${SYSTEM_FILE_FIELD}" "${OUTPUT_FILE_FIELD}"

NTDS_FILE=${form_data["ntds_file"]}
SYSTEM_FILE=${form_data["system_file"]}
OUTPUT_FILE=${form_data["output_file"]}

OUTPUT_FILE_SWITCH=""
if [[ ! -z "${OUTPUT_FILE}" ]]; then
    OUTPUT_FILE_SWITCH="-outputfile ${OUTPUT_FILE}"
fi

execute_command "secretsdump.py -ntds ${NTDS_FILE} -system ${SYSTEM_FILE} LOCAL ${OUTPUT_FILE_SWITCH}"
create_new_line
