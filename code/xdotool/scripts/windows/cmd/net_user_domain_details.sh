#!/bin/bash

: '
Net: Get domain user information.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERNAME_FIELD=$(form_item  "username" "username")

# Generate GUI form
generate_form "${USERNAME_FIELD}"

USERNAME=${form_data["username"]}

paste_command "net user ${USERNAME} /dom"
xdotool key Return
