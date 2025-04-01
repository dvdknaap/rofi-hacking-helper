#!/bin/bash

: '
smbmap: Execute 'whoami' on smb as Administrator with password.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "Username" "username" "Administrator")
PASSWORD_FIELD=$(form_item  "password" "password")
CMD_FIELD=$(form_item  "cmd" "cmd" "whoami")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${CMD_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
CMD=${form_data["cmd"]}

execute_command "smbmap -H ${IP}  -u '${USERNAME}' -p '${PASSWORD}' -x '${CMD}'"
create_new_line
