#!/bin/bash

: '
ldapsearch check for base namingcontexts
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")

# Generate GUI form
generate_form "${IP_FIELD}"

IP=${form_data["ip"]}

paste_command "ldapsearch -H ldap://${IP} -x -s base namingcontexts"
xdotool key Return
