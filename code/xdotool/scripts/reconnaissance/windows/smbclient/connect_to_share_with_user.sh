#!/bin/bash

: '
smbclient: Connect to share with user.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "Username" "username")
SHARE_FIELD=$(form_item  "Share" "share")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${SHARE_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["Userusernamename"]}
SHARE=${form_data["share"]}

execute_command "smbclient -U ${USERNAME} '//${IP}/${SHARE}'"
create_new_line

