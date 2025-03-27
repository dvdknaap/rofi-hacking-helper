#!/bin/bash

: '
decrypt cpassword from groups.xml
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CPASSWORD_FIELD=$(form_item  "cpassword" "cpassword")

# Generate GUI form
generate_form "${CPASSWORD_FIELD}"

CPASSWORD=${form_data["cpassword"]}

paste_command "gpp-decrypt ${CPASSWORD}"
xdotool key Return
