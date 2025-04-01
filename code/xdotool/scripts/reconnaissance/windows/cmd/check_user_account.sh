#!/bin/bash

: '
Net: Get user information.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERNAME_FIELD=$(form_item  "username" "username")

# Generate GUI form
generate_form "${USERNAME_FIELD}"

USERNAME=${form_data["username"]}

execute_command "net user ${USERNAME}"
create_new_line
