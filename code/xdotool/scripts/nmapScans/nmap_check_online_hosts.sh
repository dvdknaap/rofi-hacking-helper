#!/bin/bash

: '
Nmap: ping sweep
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_RANGE_FIELD=$(form_item  "ip range" "ip_range")
OUTPUT_FILE_FIELD=$(form_item  "Output location" "location" "documentation/evidence/scans/serviceEnumeration/nmap_hosts")

# Generate GUI form
generate_form "${IP_RANGE_FIELD}" "${OUTPUT_FILE_FIELD}"

IP_RANGE=${form_data["ip_range"]}
OUTPUT_FILE=${form_data["location"]}

paste_command "nmap -sn -T4 ${IP_RANGE} -oN ${OUTPUT_FILE} | grep for | cut -d\" \" -f5"
xdotool key Return
