#!/bin/bash

: '
lookupsid.py - lookup domain and user sid
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
DOMAIN_FIELD=$(form_item  "domain" "domain")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAMEUSERNAME_FIELD}" "${PASSWORD_FIELD}" "${DOMAIN_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
DOMAIN=${form_data["domain"]}

execute_command "lookupsid.py ${DOMAIN}/${USERNAME}:'${PASSWORD}'@${IP}"
create_new_line
