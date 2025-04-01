#!/bin/bash

: '
cewl - create custom wordlist
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "Website" "website")
OUTPUT_FIELD=$(form_item "output file" "output_file")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${OUTPUT_FIELD}"

WEBSITE=${form_data["website"]}
OUTPUT_FILE=${form_data["output_file"]}

execute_command "cewl '${WEBSITE}' -d 4 -m 6 -w ${OUTPUT_FILE}"
create_new_line
