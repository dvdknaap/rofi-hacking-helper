#!/bin/bash

: '
samrdump.py: brute Forcing User RIDs
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

paste_command "samrdump.py ${IP}"
xdotool key Return
