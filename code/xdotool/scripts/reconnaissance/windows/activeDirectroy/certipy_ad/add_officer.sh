#!/bin/bash

: '
add officer
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "domain" "domain")
USERNAME_FIELD=$(form_item "username" "username")
PASSWORD_FIELD=$(form_item "password" "password")
IP_FIELD=$(form_item "ip" "ip")
CA_NAME_FIELD=$(form_item "CA name" "ca_name")
OFFICER_NAME_FIELD=$(form_item "officer name" "officer_name")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${IP_FIELD}" "${CA_NAME_FIELD}" "${OFFICER_NAME_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
IP=${form_data["ip"]}
CA_NAME=${form_data["ca_name"]}
OFFICER_NAME=${form_data["officer_name"]}

execute_command "certipy-ad ca -u ${USERNAME}@${DOMAIN} -p '${PASSWORD}' -dc-ip ${IP} -ca ${CA_NAME} -add-officer ${OFFICER_NAME} -debug"
create_new_line
