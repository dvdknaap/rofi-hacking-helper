#!/bin/bash

: '
wmiexec: get shell to user
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item "IP address" "ip")
DOMAIN_FIELD=$(form_item "Domain" "domain")
USERNAME_FIELD=$(form_item "Username" "username")
PASSWORD_FIELD=$(form_item "Password" "password")

# Generate GUI form
generate_form "${IP_FIELD}" "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

IP=${form_data["ip"]}
DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

paste_command "wmiexec.py ${DOMAIN}/${USERNAME}:${PASSWORD}@${IP}"
xdotool key Return