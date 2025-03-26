#!/bin/bash

: '
FTP: check for anonymous login
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
PORT_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${PORT_FIELD}"

IP=${form_data["ip"]}
USERNAME="anonymous"
PASSWORD="anonymous"

paste_command "ftp ${IP}"
xdotool key Return
sleep 1

paste_command "${USERNAME}"
xdotool key Return
sleep 1

paste_command "${PASSWORD}"
xdotool key Return
sleep 1

paste_command "ls"
xdotool key Return
sleep 1
