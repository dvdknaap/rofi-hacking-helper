#!/bin/bash

: '
wafw00f: check if website is behind waf
'
# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")

# Generate GUI form
generate_form "${WEBSITE_FIELD}"

WEBSITE=${form_data["website"]}

execute_command "wafw00f ${WEBSITE}"
create_new_line
