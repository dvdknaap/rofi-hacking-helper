#!/bin/bash

: '
check if user is vulnerable
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
USERNAME_FIELD=$(form_item "username" "username")
PASSWORD_FIELD=$(form_item "password" "password")
IP_FIELD=$(form_item "ip" "ip")

# Generate GUI form
generate_form "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${IP_FIELD}"

USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
IP=${form_data["ip"]}

paste_command "certipy-ad find -u '${USERNAME}' -p '${PASSWORD}' -dc-ip ${IP} -stdout -vulnerable"
xdotool key Return