#!/bin/bash

: '
Connect with Evil-WinRM as user using NTLM hash.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username" "administrator")
HASH_FIELD=$(form_item  "hash" "hash")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}"

execute_command "evil-winrm -i ${IP} -u '${USERNAME}' -H '${HASH}'"
create_new_line

