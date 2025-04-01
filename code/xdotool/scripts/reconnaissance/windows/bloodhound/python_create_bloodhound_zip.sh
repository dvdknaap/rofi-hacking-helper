#!/bin/bash

: '
Create a bloodhound zip with bloodhound-python
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
DC_FIELD=$(form_item  "DC" "dc")
NS_IP_FIELD=$(form_item  "nameserver ip" "ns_ip")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${DC_FIELD}" "${NS_IP_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
DC=${form_data["dc"]}
NS_IP=${form_data["ns_ip"]}

execute_command "bloodhound-python -u '${USERNAME}' -p '${PASSWORD}' -d ${DOMAIN} -c All -dc ${DC} -ns ${NS_IP} --dns-tcp --zip"
create_new_line
