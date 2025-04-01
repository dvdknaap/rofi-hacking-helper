#!/bin/bash

: '
sqlmap: perform Authorization: Basic attack
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
URL_FIELD=$(form_item "URL" "url")
USERNAME_FIELD=$(form_item "Username" "username")
PASSWORD_FIELD=$(form_item "Password" "password")

# Generate GUI form
generate_form "${URL_FIELD}"

URL=${form_data["url"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

BASIC_BASE64=$(echo -n "${USERNAME}:${PASSWORD}" | base64)

execute_command "sqlmap -u '${URL}' --form --batch --level 5 --risk 3 --headers=\"Authorization: Basic ${BASIC_BASE64}\" --tamper=charencode"
create_new_line
