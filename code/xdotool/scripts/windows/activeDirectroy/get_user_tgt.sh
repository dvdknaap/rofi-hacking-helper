#!/bin/bash

: '
get user Ticket Granting Ticket (TGT)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

paste_command "sudo ntpdate ${IP} && getTGT.py -dc-ip {IP} ${DOMAIN}/${USERNAME}:'${PASSWORD}'"
xdotool key Return
sleep 4

paste_command "export KRB5CCNAME=*.ccache"
xdotool key Return
