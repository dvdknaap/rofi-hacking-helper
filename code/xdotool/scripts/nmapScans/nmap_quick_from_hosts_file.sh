#!/bin/bash

: '
Nmap: Scan hosts from hosts file, save output to given location.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
HOSTS_FILE_FIELD=$(form_item  "hosts file" "hosts_file")
OUTPUT_FILE_FIELD=$(form_item  "Output location" "location" "documentation/evidence/scans/serviceEnumeration/nmap_1k")

# Generate GUI form
generate_form "${HOSTS_FILE_FIELD}" "${OUTPUT_FILE_FIELD}"

HOSTS_FILE=${form_data["hosts_file"]}
OUTPUT_FILE=${form_data["location"]}

paste_command "nmap --open -oA ${OUTPUT_FILE} -iL ${HOSTS_FILE} -vvv"
xdotool key Return
