#!/bin/bash

: '
start a mssql connection
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP" "ip")
USERNAME_FIELD=$(form_item  "Username" "username")
PASSWORD_FIELD=$(form_item  "Password" "password")
PORT_FIELD=$(form_item  "Port" "port" "1433")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${PORT_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
PORT=${form_data["port"]}

paste_command "mssqlclient.py -port ${PORT} ${USERNAME}:'${PASSWORD}'@${IP} -windows-auth"
xdotool key Return