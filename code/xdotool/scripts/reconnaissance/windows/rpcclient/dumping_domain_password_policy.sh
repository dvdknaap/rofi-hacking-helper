#!/bin/bash

: '
rpcclient: Dumping domain password policy
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

paste_command "rpcclient -U "${DOMAIN}/${USERNAME}%${PASSWORD}" -I ${IP} ${DC} -c 'getdompwinfo; quit;'"
xdotool key Return

