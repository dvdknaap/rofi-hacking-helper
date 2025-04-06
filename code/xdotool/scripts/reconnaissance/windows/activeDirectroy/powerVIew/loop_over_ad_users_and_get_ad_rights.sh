#!/bin/bash

: '
powerview: loop over de ad_users and get AD rights
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
AD_USERS_LOCATION_FIELD=$(form_item  "AD users file location" "ad_users_location" "ad_users.txt")

# Generate GUI form
generate_form "${AD_USERS_LOCATION_FIELD}"

AD_USERS_LOCATION=${form_data["ad_users_location"]}

execute_command "foreach(\$line in [System.IO.File]::ReadLines(\"${AD_USERS_LOCATION}\")) {get-acl \"AD:\$(Get-ADUser \$line)\" }"
create_new_line
