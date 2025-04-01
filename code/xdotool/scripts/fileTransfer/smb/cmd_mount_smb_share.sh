#!/bin/bash

: '
cmd: mount smb share
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SHARE_FIELD=$(form_item "share name" "share")

# Generate GUI form
generate_form "${SHARE_FIELD}"

SHARE=${form_data["share"]}

execute_command "net use n: \\\\${KALI_IP}\\${SHARE}"
create_new_line
