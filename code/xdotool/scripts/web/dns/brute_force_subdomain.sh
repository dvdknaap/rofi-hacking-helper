#!/bin/bash

: '
brute force subdomain
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "domain" "domain")
OUTPUT_FILE_FIELD=$(form_item "output file" "output_file" "subdomains.txt")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${OUTPUT_FILE_FIELD}"

DOMAIN=${form_data["domain"]}
OUTPUT_FILE=${form_data["output_file"]}

execute_command "for sub in \$(cat /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt);do dig \$sub.${DOMAIN} | grep -v ';\|SOA' | sed -r '/^\s*$/d' | grep \$sub | tee -a ${OUTPUT_FILE};done"
create_new_line
