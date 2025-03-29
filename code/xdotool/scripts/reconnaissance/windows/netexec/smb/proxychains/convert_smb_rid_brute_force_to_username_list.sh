#!/bin/bash

: '
convert smb rid-bruteforce to users list
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
INPUT_FILE_FIELD=$(form_item  "input file" "input_file")
OUTPUT_FILE_FIELD=$(form_item  "output file" "output_file")

# Generate GUI form
generate_form "${INPUT_FILE_FIELD}" "${OUTPUT_FILE_FIELD}"

INPUT_FILE=${form_data["input_file"]}
OUTPUT_FILE=${form_data["output_file"]}

paste_command "cat ${INPUT_FILE} | grep 'SidTypeUser' | awk '{print \$6}'  | awk -F '\' '{print \$2}' | tr '[:upper:]' '[:lower:]' | grep -v '\\$' > ${OUTPUT_FILE}"
xdotool key Return
