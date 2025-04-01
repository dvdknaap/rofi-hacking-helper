#!/bin/bash

: '
hydra: smb brute force with userpass file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item "IP address" "ip")
USERPASS_FILE_FIELD=$(form_item "userpass file" "userpass_file")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERPASS_FILE_FIELD}"

IP=${form_data["ip"]}
USERPASS_FILE=${form_data["userpass_file"]}

execute_command "hydra -C ${USERPASS_FILE} smb://${IP}"
create_new_line

