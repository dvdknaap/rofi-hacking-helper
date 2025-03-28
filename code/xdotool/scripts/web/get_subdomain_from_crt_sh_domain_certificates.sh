#!/bin/bash

: '
get unique subdomains with crt.sh domain certificates
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "domain" "domain")
OUTPUT_FILE_FIELD=$(form_item "output file" "output_file" "subdomains.txt")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${OUTPUT_FILE_FIELD}"

DOMAIN=${form_data["domain"]}
OUTPUT_FILE=${form_data["output_file"]}

paste_command "curl -s 'https://crt.sh/?q=${DOMAIN}&output=json' | jq . | grep name | cut -d\":\" -f2 | grep -v \"CN=\" | cut -d'\"' -f2 | awk '{gsub(/\\n/,\"\n\");}1;' | sort -u > ${OUTPUT_FILE}"
xdotool key Return
