#!/bin/bash

: '
ssh: forward RDP port with id_rsa file
'
# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
USERNAME_FIELD=$(form_item  "username" "username")
INERNAL_PORT_FIELD=$(form_item  "internal IP" "internal_ip")
ID_RSA_FILE_FIELD=$(form_item  "id_rsa file" "id_rsa_file")
LOCAL_PORT_FIELD=$(form_item  "local port" "local_port")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNAME_FIELD}" "${INERNAL_PORT_FIELD}" "${LOCAL_PORT_FIELD}"

IP=${form_data["ip"]}
USERNAME=${form_data["username"]}
INERNAL_PORT=${form_data["internal IP"]}
ID_RSA_FILE=${form_data["id_rsa_file"]}
LOCAL_PORT=${form_data["local_port"]}

paste_command "ssh -L ${LOCAL_PORT}:${INERNAL_PORT}:3389 -i ${ID_RSA_FILE} ${USERNAME}@${IP}"
