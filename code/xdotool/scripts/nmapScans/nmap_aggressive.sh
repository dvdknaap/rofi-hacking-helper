#!/bin/bash

: '
Nmap: Aggressive scan all ports, save output.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
TIMING_FIELD=$(form_item "select timing" "select" "timing" "aggressive" "paranoid|sneaky|polite|normal|aggressive|insane")
OUTPUT_FILE_FIELD=$(form_item  "Output location" "location" "documentation/evidence/scans/serviceEnumeration/nmap")

# Generate GUI form
generate_form "${IP_FIELD}" "${TIMING_FIELD}" "${OUTPUT_FILE_FIELD}"

IP=${form_data["ip"]}
TIMING=${form_data["timing"]}
OUTPUT_FILE=${form_data["location"]}

paste_command "nmap -p- -sC -A -T ${TIMING} -vvv --min-parallelism 10  --min-rate 1000 -oA ${OUTPUT_FILE} -Pn ${IP}"
xdotool key Return
