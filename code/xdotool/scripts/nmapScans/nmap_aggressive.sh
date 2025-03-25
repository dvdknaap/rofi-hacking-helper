#!/bin/bash

: '
Nmap: Aggressive scan all ports, save output.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
OUTPUT_FILE_FIELD=$(form_item  "Output location" "location" "documentation/evidence/scans/serviceEnumeration/nmap")

# Generate GUI form
generate_form "${IP_FIELD}" "${OUTPUT_FILE_FIELD}"

IP=${form_data["ip"]}
OUTPUT_FILE=${form_data["location"]}

paste_command "nmap -p- -sC -A -T4 -vvv --min-parallelism 10  --min-rate 1000 -oA ${OUTPUT_FILE} -Pn ${IP}"
xdotool key Return
