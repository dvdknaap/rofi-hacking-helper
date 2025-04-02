#!/bin/bash

: '
check if current user has (sysadmin) role
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
ROLE_FIELD=$(form_item  "role" "role" "sysadmin")

# Generate GUI form
generate_form "${ROLE_FIELD}"

ROLE=${form_data["role"]}

execute_command "SELECT IS_SRVROLEMEMBER('${ROLE}')"
create_new_line
