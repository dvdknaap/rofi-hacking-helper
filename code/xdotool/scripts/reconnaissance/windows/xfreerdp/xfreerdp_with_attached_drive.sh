#!/bin/bash

: '
xfreerdp: Connect, map drive 'tools' to current directory (check `net use` for the location).
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "Username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
DRIVE_NAME_FIELD=$(form_item  "drive name" "drive_name" "tools")
DRIVE_DIR_FIELD=$(form_item  "drive dir" "drive_dir" "./tools")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${DRIVE_NAME_FIELD}" "${DRIVE_DIR_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
DRIVE_NAME=${form_data["drive_name"]}
DRIVE_DIR=${form_data["drive_dir"]}

execute_command "xfreerdp3 /u:'${USERNAME}' /p:'${PASSWORD}' /v:${IP} /cert:ignore /smart-sizing /size:1920x1080 /dynamic-resolution /drive:${DRIVE_NAME},\"${DRIVE_DIR}\""
create_new_line
