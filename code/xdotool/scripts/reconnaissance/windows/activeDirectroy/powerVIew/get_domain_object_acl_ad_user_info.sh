#!/bin/bash

: '
powerview: get DomainObjectACL AD user info
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
AD_USERNAME_FIELD=$(form_item  "AD user" "ad_user")

# Generate GUI form
generate_form "${AD_USERNAME_FIELD}"

AD_USERNAME=${form_data["ad_user"]}

execute_command "\$sid = Convert-NameToSid ${AD_USERNAME}"
create_new_line
sleep 0.8

execute_command "Get-DomainObjectACL -Identity * | ?{\$_.SecurityIdentifier -eq \$sid}"
create_new_line
