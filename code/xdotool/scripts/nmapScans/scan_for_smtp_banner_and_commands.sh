#!/bin/bash

: '
Nmap: scan for smtp banner en commands
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

paste_command "nmap ${IP} -p 25 --script banner,smtp-commands -vvv"
xdotool key Return
