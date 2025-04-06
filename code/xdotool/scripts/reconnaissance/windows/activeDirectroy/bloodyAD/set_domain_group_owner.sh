#!/bin/bash

: '
bloody AD: add user to group
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")
AD_USERNAME_FIELD=$(form_item  "user" "user")
PASSWORD_FIELD=$(form_item  "password" "password")
GROUP_NAME_FIELD=$(form_item  "group name" "group_name")

# Generate GUI form
generate_form "${IP_FIELD}" "${AD_USERNAME_FIELD}" "${PASSWORD_FIELD}" "${GROUP_NAME_FIELD}"

IP=${form_data["ip"]}
AD_USERNAME=${form_data["aduser_user"]}
PASSWORD=${form_data["password"]}
GROUP_NAME=${form_data["group_name"]}

execute_command "bloodyAD --host ${IP} -u '${AD_USERNAME}' -p '${PASSWORD}' -d bloody add groupMember '${GROUP_NAME}' '${AD_USERNAME}'"
create_new_line

