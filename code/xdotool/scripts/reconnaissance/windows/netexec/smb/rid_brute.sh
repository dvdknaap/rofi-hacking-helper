#!/bin/bash

: '
enumerate users by bruteforcing RIDs
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
RID_OUTPUT_FILE_FIELD=$(form_item  "rid output file" "rid_output_file")
USERS_FILE_FIELD=$(form_item  "users file" "users_file")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${RID_OUTPUT_FILE_FIELD}" "${USERS_FILE_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
RID_OUTPUT_FILE=${form_data["rid_output_file"]}
USERS_FILE=${form_data["users_file"]}

execute_command "netexec smb ${IP} -u '${USERNAME}' -p '${PASSWORD}' --rid-brute 10000 > ${RID_OUTPUT_FILE} && cat ${RID_OUTPUT_FILE} | grep 'SidTypeUser' | awk '{print \$6}'  | awk -F '\' '{print \$2}' | tr '[:upper:]' '[:lower:]' | grep -v '\\$' > ${USERS_FILE}"
create_new_line
