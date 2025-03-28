#!/bin/bash

: '
braa: get public info of server
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
COMMUNITY_STRING_FIELD=$(form_item  "community string" "community_string" "public")

# Generate GUI form
generate_form "${IP_FIELD}" "${COMMUNITY_STRING_FIELD}"

IP=${form_data["ip"]}
COMMUNITY_STRING=${form_data["community_string"]}

paste_command "braa ${COMMUNITY_STRING}@${IP}:.1.3.6.* "
xdotool key Return
