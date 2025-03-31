#!/bin/bash

: '
msf-virustotal: check file for virus scanner detection
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file")
VIRUS_TOTAL_API_KEY_FIELD=$(form_item  "Virus Total API Key" "virus_total_api_key" "$(get_dynamic_field "VIRUS_TOTAL_API_KEY")")

# Generate GUI form
generate_form "${FILE_FIELD}" "${VIRUS_TOTAL_API_KEY_FIELD}"

FILE=${form_data["file"]}
VIRUS_TOTAL_API_KEY=${form_data["virus_total_api_key"]}

paste_command "yes | msf-virustotal -k ${VIRUS_TOTAL_API_KEY} -f ${FILE}"
xdotool key Return
