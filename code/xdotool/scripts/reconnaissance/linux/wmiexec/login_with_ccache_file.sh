#!/bin/bash

: '
login with wmiexec with ccache file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")

# Generate GUI form
generate_form "${DOMAIN_FIELD}"

DOMAIN_FIELD=${form_data["domain"]}

execute_command "python3 wmiexec.py ${DOMAIN_FIELD} -k"
create_new_line
