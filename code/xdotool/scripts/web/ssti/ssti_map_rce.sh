#!/bin/bash

: '
SSTImap - execute cmd (RCE)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
CMD_FIELD=$(form_item "cmd" "cmd")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${CMD_FIELD}"

WEBSITE=${form_data["website"]}
CMD=${form_data["cmd"]}

execute_command "sstimap -u '${WEBSITE}' -S '${CMD}'"
create_new_line
