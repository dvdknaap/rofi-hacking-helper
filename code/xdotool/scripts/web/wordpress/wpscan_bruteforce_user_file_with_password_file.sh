#!/bin/bash

: '
wpscan bruteforce user file with password file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
USERNAME_FILE_FIELD=$(form_item "username file" "username_file")
PASSWORD_FILE_FIELD=$(form_item "password file" "password_file")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${USERNAME_FILE_FIELD}" "${PASSWORD_FILE_FIELD}"

WEBSITE=${form_data["website"]}
USERNAME_FILE=${form_data["username_file"]}
PASSWORD_FILE=${form_data["password_file"]}

execute_command "wpscan --url ${WEBSITE} --usernames ${USERNAME_FILE} --passwords ${PASSWORD_FILE} -t 50"
create_new_line
