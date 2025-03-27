#!/bin/bash

: '
Run Snaffler on domain.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "Domain" "domain")
OUTPUT_FILE_FIELD=$(form_item "output file" "output_file")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${OUTPUT_FILE_FIELD}"

DOMAIN=${form_data["domain"]}
OUTPUT_FILE=${form_data["output_file"]}

paste_command "Snaffler.exe -s -d ${DOMAIN} -o ${OUTPUT_FILE} -v data"
xdotool key Return
