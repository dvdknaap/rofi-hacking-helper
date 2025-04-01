#!/bin/bash

: '
check if smb is possible for username and hash
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username" "administrator")
HASH_FIELD=$(form_item  "hash" "hash")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
HASH=${form_data["hash"]}

execute_command "netexec smb ${IP} -u ${USERNAME} -H ${HASH}"
create_new_line
