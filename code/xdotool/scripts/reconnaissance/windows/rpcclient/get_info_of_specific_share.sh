#!/bin/bash

: '
rpcclient: provides information about a specific share
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
IP_FIELD=$(form_item  "ip" "ip")
DC_FIELD=$(form_item  "DC" "dc")
SHARE_FIELD=$(form_item  "share" "share")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${IP_FIELD}" "${DC_FIELD}" "${SHARE_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
IP=${form_data["ip"]}
DC=${form_data["dc"]}
SHARE=${form_data["share"]}

paste_command "rpcclient -U "${DOMAIN}/${USERNAME}%${PASSWORD}" -I ${IP} ${DC} -c 'netsharegetinfo ${SHARE}; quit;'"
xdotool key Return

