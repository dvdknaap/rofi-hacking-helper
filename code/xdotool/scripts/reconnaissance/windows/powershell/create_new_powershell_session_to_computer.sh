#!/bin/bash

: '
Powershell - login to user on a different computer
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
COMPUTER_NAME_FIELD=$(form_item  "computer name" "computer_name")
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "Username" "username")

# Generate GUI form
generate_form "${COMPUTER_NAME_FIELD}" "${DOMAIN_FIELD}" "${USERNAME_FIELD}"

COMPUTER_NAME=${form_data["computer_name"]}
DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}

paste_command "Enter-PSSession -ComputerName ${COMPUTER_NAME} -Credential ${DOMAIN}\\${USERNAME}"
xdotool key Return
