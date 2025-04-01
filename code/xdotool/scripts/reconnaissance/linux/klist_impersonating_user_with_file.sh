#!/bin/bash

: '
klist: impersonating user with file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "file" "file")
USERNAME_FIELD=$(form_item  "username" "username")
DOMAIN_FIELD=$(form_item  "domain" "domain")

# Generate GUI form
generate_form "${FILE_FIELD}" "${USERNAME_FIELD}" "${DOMAIN_FIELD}"

FILE=${form_data["file"]}
USERNAME=${form_data["username"]}
DOMAIN=${form_data["domain"]}

execute_command "klist ${USERNAME}@${DOMAIN} -k -t ${FILE}"
create_new_line
