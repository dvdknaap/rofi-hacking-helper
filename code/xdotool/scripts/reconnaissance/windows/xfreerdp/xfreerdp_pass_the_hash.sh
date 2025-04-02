#!/bin/bash

: '
xfreerdp: Connect with specified credentials with pass the hash
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "Username" "username")
HASH_FIELD=$(form_item  "hash" "hash")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
HASH=${form_data["hash"]}

execute_command "xfreerdp3 /u:'${USERNAME}' /pth:'${HASH}' /v:${IP} /cert:ignore /smart-sizing /size:1920x1080 /dynamic-resolution"
create_new_line
