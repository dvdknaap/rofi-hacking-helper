#!/bin/bash

: '
Net: Add user, add to Exchange Windows Permissions and Remote Mgmt groups.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERNAME_FIELD=$(form_item  "username" "new_username" "john")
PASSWORD_FIELD=$(form_item  "password" "new_password" "abc123!")

# Generate GUI form
generate_form "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

USERNAME=${form_data["new_username"]}
PASSWORD=${form_data["new_password"]}

execute_command "net user ${USERNAME} '${PASSWORD}' /add /domain"
create_new_line

execute_command "net group "Exchange Windows Permissions" ${USERNAME} /add"
create_new_line

execute_command "net localgroup "Remote Management Users" ${USERNAME} /add"
create_new_line

