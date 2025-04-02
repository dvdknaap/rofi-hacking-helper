#!/bin/bash

: '
xfreerdp: Connect with specified credentials.
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

execute_command "xfreerdp3 /u:'${USERNAME}' /p:'${PASSWORD}' /v:${IP} /cert:ignore /smart-sizing /size:1920x1080 /dynamic-resolution"
create_new_line
