#!/bin/bash

: '
netexec smb use spider_plus to get all share files
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
SHARE_FIELD=$(form_item  "share" "share")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${SHARE_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
SHARE=${form_data["share"]}

paste_command "netexec smb ${IP} -u '${USERNAME}' -p '${PASSWORD}' -M spider_plus --share '${SHARE}'"
xdotool key Return
 