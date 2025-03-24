#!/bin/bash

: '
FTP: login with username and password
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

paste_command "ftp ${IP}"
xdotool key Return
sleep 1

paste_command "${USERNAME}"
xdotool key Return
sleep 1

paste_command "${PASSWORD}"
xdotool key Return
sleep 1

paste_command "ls"
xdotool key Return
sleep 1