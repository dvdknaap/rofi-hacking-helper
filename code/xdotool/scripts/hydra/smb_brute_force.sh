#!/bin/bash

: '
hydra: smb brute force
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item "IP address" "ip")
USER_FILE_FIELD=$(form_item "user file" "user_file")
PASSWORD_FILE_FIELD=$(form_item "password file" "password_file")

# Generate GUI form
generate_form "${IP_FIELD}" "${USER_FILE_FIELD}" "${PASSWORD_FILE_FIELD}"

IP=${form_data["ip"]}
USER_FILE=${form_data["user_file"]}
PASSWORD_FILE=${form_data["password_file"]}

execute_command "hydra -L ${USER_FILE} -P ${PASSWORD_FILE} smb://${IP}"
create_new_line

