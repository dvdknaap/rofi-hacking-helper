#!/bin/bash

: '
powerview: get domain user info
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain name" "domain")
AD_USERNAME_FIELD=$(form_item  "AD user" "ad_user" "administrator")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${AD_USERNAME_FIELD}"

DOMAIN=${form_data["domain"]}
AD_USERNAME=${form_data["ad_user"]}

execute_command "Get-DomainUser -Identity ${AD_USERNAME} -Domain ${DOMAIN}"
create_new_line

