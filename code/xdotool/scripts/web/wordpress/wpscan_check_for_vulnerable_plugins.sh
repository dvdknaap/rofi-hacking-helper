#!/bin/bash

: '
wpscan check for vulnerable plugins
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")

# Generate GUI form
generate_form "${WEBSITE_FIELD}"

WEBSITE=${form_data["website"]}

paste_command "wpscan --url '${WEBSITE}' --enumerate vp"
xdotool key Return
