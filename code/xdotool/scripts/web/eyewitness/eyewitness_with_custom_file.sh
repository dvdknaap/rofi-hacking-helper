#!/bin/bash

: '
execute eyewitness with custom file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SUBDOMAINS_FILE_FIELD=$(form_item "subdomains file" "subdomains_file" "documentation/evidence/notes/subdomains")
OUTPUT_FOLDER_FIELD=$(form_item "output folder" "output_folder" "documentation/evidence/scans/web/eyeWitness")

# Generate GUI form
generate_form "${SUBDOMAINS_FILE_FIELD}" "${OUTPUT_FOLDER_FIELD}"

SUBDOMAINS_FILE=${form_data["subdomains_file"]}
OUTPUT_FOLDER=${form_data["output_folder"]}

execute_command "eyewitness -f ${SUBDOMAINS_FILE} -d ${OUTPUT_FOLDER}"
create_new_line
