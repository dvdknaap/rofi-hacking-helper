#!/bin/bash

: '
powerview: creating a List of Domain Users
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
AD_USERS_LOCATION_FIELD=$(form_item  "AD users file location" "ad_users_location" "ad_users.txt")

# Generate GUI form
generate_form "${AD_USERS_LOCATION_FIELD}"

AD_USERS_LOCATION=${form_data["ad_users_location"]}

execute_command "Get-ADUser -Filter * | Select-Object -ExpandProperty SamAccountName > ${AD_USERS_LOCATION}"
create_new_line
