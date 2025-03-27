#!/bin/bash

: '
ldapsearch check for specific namingcontexts
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
NAMING_CONTEXTS_FIELD=$(form_item  "namingcontexts" "namingcontexts")

# Generate GUI form
generate_form "${IP_FIELD}" "${NAMING_CONTEXTS_FIELD}"

IP=${form_data["ip"]}
NAMING_CONTEXTS=${form_data["namingcontexts"]}

paste_command "ldapsearch -H ldap://${IP} -x -b \"DC=${NAMING_CONTEXTS}\""
xdotool key Return
