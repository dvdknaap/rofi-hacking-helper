#!/bin/bash

: '
Nmap: ping sweep
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
OUTPUT_FILE_FIELD=$(form_item  "Output location" "location" "documentation/evidence/scans/serviceEnumeration/nmap_hosts")

# Generate GUI form
generate_form "${IP_FIELD}" "${OUTPUT_FILE_FIELD}"

IP=${form_data["ip"]}
OUTPUT_FILE=${form_data["location"]}

paste_command "nmap -sn -T4 ${IPRANGE} -oN ${OUTPUT_FILE}"