#!/bin/bash

: '
create ports list and save to file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SEQUENCE_START_FIELD=$(form_item  "sequence start" "number" "sequence_start" "1")
SEQUENCE_END_FIELD=$(form_item  "sequence end" "number" "sequence_end" "65535")
EQUAL_WIDTH_FIELD=$(form_item  "equal lengths" "select" "equal_lengths" "no" "no|yes")
OUTPUT_FILE_FIELD=$(form_item  "output file" "output_file" "ports.txt")

# Generate GUI form
generate_form "${SEQUENCE_START_FIELD}" "${SEQUENCE_END_FIELD}" "${EQUAL_WIDTH_FIELD}" "${OUTPUT_FILE_FIELD}"

SEQUENCE_START=${form_data["sequence_start"]}
SEQUENCE_END=${form_data["sequence_end"]}
EQUAL_WIDTH=${form_data["equal_lengths"]}
OUTPUT_FILE=${form_data["output_file"]}

equal_length_switch=""
if [[ "${EQUAL_WIDTH}" == "yes" ]]; then
    equal_length_switch="-w "
fi

execute_command "seq ${equal_length_switch}${SEQUENCE_START} ${SEQUENCE_END} > ${OUTPUT_FILE}"
create_new_line
