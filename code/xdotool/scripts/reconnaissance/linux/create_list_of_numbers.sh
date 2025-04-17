#!/bin/bash

: '
create a list of numbers. e.g. 2FA codes or ports and save to file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SEQUENCE_START_FIELD=$(form_item  "sequence start" "number" "sequence_start" "1")
SEQUENCE_END_FIELD=$(form_item  "sequence end" "number" "sequence_end" "65535")
OUTPUT_FILE_FIELD=$(form_item  "output file" "output_file" "ports.txt")

# Generate GUI form
generate_form "${SEQUENCE_START_FIELD}" "${SEQUENCE_END_FIELD}" "${OUTPUT_FILE_FIELD}"

SEQUENCE_START=${form_data["sequence_start"]}
SEQUENCE_END=${form_data["sequence_end"]}
OUTPUT_FILE=${form_data["output_file"]}

execute_command "seq ${SEQUENCE_START} ${SEQUENCE_END} > ${OUTPUT_FILE}"
create_new_line
