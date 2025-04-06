#!/bin/bash

: '
powerview: add user to ad group
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain name" "domain")
AD_USERNAME_FIELD=$(form_item  "AD user" "ad_user")
PASSWORD_FIELD=$(form_item  "password" "password")
GROUP_NAME_FIELD=$(form_item  "group name" "group_name")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${AD_USERNAME_FIELD}" "${PASSWORD_FIELD}" "${GROUP_NAME_FIELD}"

DOMAIN=${form_data["domain"]}
AD_USERNAME=${form_data["ad_user"]}
PASSWORD=${form_data["password"]}
GROUP_NAME=${form_data["group_name"]}

execute_command "\$username = '${DOMAIN}\\${AD_USERNAME}'"
create_new_line
sleep 0.8

execute_command "\$password = '${PASSWORD}'"
create_new_line
sleep 0.8

execute_command "\$securePassword = ConvertTo-SecureString \$password -AsPlainText -Force"
create_new_line
sleep 0.8

execute_command "\$credential = New-Object System.Management.Automation.PSCredential \$username, \$securePassword"
create_new_line
sleep 0.8

execute_command "Add-DomainGroupMember -Identity '${GROUP_NAME}' -Member '${AD_USERNAME}' -Credential \$credential -Verbose"
create_new_line

