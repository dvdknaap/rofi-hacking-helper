#!/bin/bash

: '
enumerate users by bruteforcing RIDs
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

execute_command "netexec smb ${IP} -u '${USERNAME}' -p '${PASSWORD}' --rid-brute"
create_new_line
