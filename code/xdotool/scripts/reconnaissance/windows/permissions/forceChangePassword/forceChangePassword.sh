#!/bin/bash

: '
PowerShell: Force change password for user.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERNAME_FIELD=$(form_item  "username" "username")
NEW_PASSWORD_FIELD=$(form_item  "new password" "new_password" "Str0ngpass86!")

# Generate GUI form
generate_form "${USERNAME_FIELD}" "${NEW_PASSWORD_FIELD}"

USERNAME=${form_data["username"]}
NEW_PASSWORD_FILE=${form_data["new_password"]}

execute_command "Set-DomainUserPassword -Identity '${USERNAME}' -AccountPassword (ConvertTo-SecureString '${NEW_PASSWORD_FILE}' -AsPlainText -Force ) -Verbose"
create_new_line
