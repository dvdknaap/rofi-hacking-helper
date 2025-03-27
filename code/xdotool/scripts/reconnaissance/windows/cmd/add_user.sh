#!/bin/bash

: '
Net: Add use, add to administrators and RDP groups.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERNAME_FIELD=$(form_item  "username" "new_username" "john")
PASSWORD_FIELD=$(form_item  "password" "new_password" "abc123!")

# Generate GUI form
generate_form "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

USERNAME=${form_data["new_username"]}
PASSWORD=${form_data["new_password"]}

paste_command "net user ${USERNAME} ${PASSWORD} /add && net localgroup administrators ${USERNAME} /add && net localgroup \"Remote Desktop Users\" ${USERNAME} /add"
xdotool key Return
