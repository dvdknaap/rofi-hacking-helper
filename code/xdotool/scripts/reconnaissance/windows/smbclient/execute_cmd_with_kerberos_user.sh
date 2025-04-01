#!/bin/bash

: '
smbclient: execute cmd with kerberos user
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "domain" "domain")
USER_FIELD=$(form_item "username" "username")
CMD_FIELD=$(form_item "cmd" "cmd")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USER_FIELD}" "${CMD_FIELD}"

DOMAIN=${form_data["domain"]}
USER=${form_data["username"]}
CMD=${form_data["cmd"]}

execute_command "smbclient //${DOMAIN}/${USER} -k -c '${CMD}'"
create_new_line
