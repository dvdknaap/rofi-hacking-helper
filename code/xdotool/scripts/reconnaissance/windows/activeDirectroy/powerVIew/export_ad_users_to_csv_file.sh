#!/bin/bash

: '
powerview: export ad users to csv file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain name" "domain")
CSV_OUTPUT_FILE_FIELD=$(form_item  "output file" "csv_output_file" ".\ad_users.csv")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${CSV_OUTPUT_FILE_FIELD}"

DOMAIN=${form_data["domain"]}
CSV_OUTPUT_FILE=${form_data["csv_output_file"]}

execute_command "Get-DomainUser * -Domain ${DOMAIN} | Select-Object -Property name,samaccountname,description,memberof,whencreated,pwdlastset,lastlogontimestamp,accountexpires,admincount,userprincipalname,serviceprincipalname,mail,useraccountcontrol | Export-Csv ${CSV_OUTPUT_FILE} -NoTypeInformation"
create_new_line

