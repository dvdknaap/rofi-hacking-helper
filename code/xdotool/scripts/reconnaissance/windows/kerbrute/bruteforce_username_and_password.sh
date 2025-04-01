#!/bin/bash

: '
kerbrute: user enumerate on DC
'

FILE_LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/kerbrute/.files"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "Ip" "ip")
DOMAIN_FIELD=$(form_item  "Domain" "domain")
USERNAME_FILE_FIELD=$(form_item  "Username file" "username_file")

# Generate GUI form
generate_form "${IP_FIELD}" "${DOMAIN_FIELD}" "${USERNAME_FILE_FIELD}"

IP=${form_data["ip"]}
DOMAIN=${form_data["domain"]}
USERNAME_FILE=${form_data["username_file"]}

execute_command "${FILE_LOCATION}/kerbrute userenum -d ${DOMAIN} --dc ${IP} ${USERNAME_FILE} -v"
create_new_line
