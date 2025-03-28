#!/bin/bash

: '
Nmap: scan for specific category
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "ip" "ip")
PORT_FIELD=$(form_item  "port" "number" "port" "80")
CATEGORY_FIELD=$(form_item "select category" "select" "category" "vuln" "auth|broadcast|brute|default|discovery|dos|exploit|external|fuzzer|intrusive|malware|safe|version|vuln")

# Generate GUI form
generate_form "${IP_FIELD}" "${PORT_FIELD}" "${CATEGORY_FIELD}"

IP=${form_data["ip"]}
PORT=${form_data["port"]}
CATEGORY=${form_data["category"]}

paste_command "nmap ${IP} -p ${PORT} -script ${CATEGORY} -vvv"
xdotool key Return
