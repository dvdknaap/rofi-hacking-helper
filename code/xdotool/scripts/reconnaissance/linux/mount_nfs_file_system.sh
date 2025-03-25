#!/bin/bash

: '
mount to ip
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
TARGET_DIR_FIELD=$(form_item  "target directory" "target_dir")

# Generate GUI form
generate_form "${IP_FIELD}" "${TARGET_DIR_FIELD}"

IP=${form_data["ip"]}
TARGET_DIR=${form_data["target_dir"]}

paste_command "mkdir ${TARGET_DIR} && sudo mount -t nfs ${IP}:/ ./${TARGET_DIR}/ -o nolock && cd ${TARGET_DIR} && tree ."
xdotool key Return
