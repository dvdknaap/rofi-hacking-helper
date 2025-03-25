#!/bin/bash

: '
wget: download files from ftp
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "Username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
LEVEL_DEPTH_FIELD=$(form_item  "Folder depth level" "number" "level_depth" "1")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${LEVEL_DEPTH_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
LEVEL_DEPTH=${form_data["level_depth"]}

paste_command "wget --no-verbose --no-parent --recursive --level=${LEVEL_DEPTH} --no-directories --user='${USERNAME}' --password='${PASSWORD}' ftp://${IP}/"
xdotool key Return