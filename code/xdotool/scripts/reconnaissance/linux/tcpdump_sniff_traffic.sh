#!/bin/bash

: '
sniff for traffic with tcpdump and save to pcap file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
INTERFACE_NAME_FIELD=$(form_item  "interface name" "interface_name" "eth0")
OUTPUT_FILE_FIELD=$(form_item  "output file" "output_file" "traffic.pcap")

# Generate GUI form
generate_form "${INTERFACE_NAME_FIELD}" "${OUTPUT_FILE_FIELD}"

INTERFACE_NAME=${form_data["interface_name"]}
OUTPUT_FILE=${form_data["output_file"]}

execute_command "tcpdump -i ${INTERFACE_NAME} -vv -w ${OUTPUT_FILE}"
create_new_line
