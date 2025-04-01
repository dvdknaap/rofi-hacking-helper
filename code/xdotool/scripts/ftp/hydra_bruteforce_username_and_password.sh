#!/bin/bash

: '
hydra: bruteforce username and password
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "Username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

execute_command "hydra -L ${USERNAME} -P ${PASSWORD} ${IP} ftp -V"
create_new_line
