#!/bin/bash

: '
SCP upload file to server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
ID_RSA_FIELD=$(form_item "id_rsa file" "id_rsa_file")
USERNAME_FIELD=$(form_item "username" "username")
IP_FIELD=$(form_item "IP" "ip")
REMOTE_FILE_FIELD=$(form_item "remote file path" "remote_file_path")
LOCAL_PATH_FIELD=$(form_item "local path" "local_path")

# Generate GUI form
generate_form "${ID_RSA_FIELD}" "${USERNAME_FIELD}" "${IP_FIELD}" "${REMOTE_FILE_FIELD}" "${LOCAL_PATH_FIELD}" 

ID_RSA_FILE=${form_data["id_rsa_file"]}
USERNAME=${form_data["username"]}
IP=${form_data["ip"]}
REMOTE_FILE_PATH=${form_data["remote_file_path"]}
LOCAL_PATH=${form_data["local_path"]}

execute_command "scp -i ${ID_RSA_FILE} ${LOCAL_PATH} ${USERNAME}@${IP}:${REMOTE_FILE_PATH}"
create_new_line
