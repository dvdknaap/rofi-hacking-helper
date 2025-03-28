#!/bin/bash

: '
wafw00f: check if website is behind waf
'
# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")

# Generate GUI form
generate_form "${WEBSITE_FIELD}"

WEBSITE=${form_data["website"]}

paste_command "wafw00f ${WEBSITE}"
xdotool key Return
