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

execute_command "use auxiliary/server/socks_proxy"
create_new_line
sleep 1

execute_command "set SRVPORT ${PORT}"
create_new_line
sleep 0.8

execute_command "set VERSION ${VERSION}"
create_new_line
sleep 0.8

execute_command "run"
create_new_line
