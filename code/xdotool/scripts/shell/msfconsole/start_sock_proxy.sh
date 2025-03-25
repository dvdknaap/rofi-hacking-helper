#!/bin/bash

: '
Start socks proxy
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "Port" "number" "port" "1337")
VERSION_FIELD=$(form_item "Version" "number" "version" "5" "4|5")

# Generate GUI form
generate_form "${PORT_FIELD}" "${VERSION_FIELD}" 

PORT=${form_data["port"]}
VERSION=${form_data["version"]}

paste_command "use auxiliary/server/socks_proxy"
xdotool key Return
sleep 1

paste_command "set SRVPORT ${PORT}"
xdotool key Return
sleep 0.8

paste_command "set VERSION ${VERSION}"
xdotool key Return
sleep 0.8

paste_command "run"
xdotool key Return
