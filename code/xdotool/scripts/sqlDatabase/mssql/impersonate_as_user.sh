#!/bin/bash

: '
impersonating the (sa) user
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USER_FIELD=$(form_item  "user" "user" "sa")

# Generate GUI form
generate_form "${USER_FIELD}"

USER=${form_data["user"]}

execute_command "EXECUTE AS LOGIN = '${USER}';"
execute_command "SELECT SYSTEM_USER;"
execute_command "SELECT IS_SRVROLEMEMBER('sysadmin');"
execute_command "GO"
create_new_line
