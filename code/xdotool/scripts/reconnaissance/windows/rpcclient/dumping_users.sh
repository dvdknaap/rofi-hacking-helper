#!/bin/bash

: '
rpcclient: Dumping users
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
IP_FIELD=$(form_item  "ip" "ip")
DC_FIELD=$(form_item  "DC" "dc")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${IP_FIELD}" "${DC_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
IP=${form_data["ip"]}
DC=${form_data["dc"]}

execute_command "rpcclient -U "${DOMAIN}/${USERNAME}%${PASSWORD}" -I ${IP} ${DC} -c 'enumdomusers; quit;' | awk '{print \$1}' | awk -F: '{print \$2}' | cut -f 2 -d '[' | cut -f 1 -d ']'"
create_new_line
