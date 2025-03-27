#!/bin/bash

: '
smbclient: Connect to share anonymous.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
SHARE_FIELD=$(form_item  "Share" "share")

# Generate GUI form
generate_form "${IP_FIELD}" "${SHARE_FIELD}"

IP=${form_data["ip"]}
SHARE=${form_data["share"]}

paste_command "smbclient //${IP}/${SHARE}/"
xdotool key Return
