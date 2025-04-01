#!/bin/bash

: '
convert subdomains list to ip addresses
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "domain" "domain")
SUBDOMAINS_FILE_FIELD=$(form_item "subdomains file" "subdomains_file" "subdomains.txt")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${SUBDOMAINS_FILE_FIELD}"

DOMAIN=${form_data["domain"]}
SUBDOMAINS_FILE=${form_data["subdomains_file"]}

execute_command "for i in \$(cat ${SUBDOMAINS_FILE});do host \$i | grep \"has address\" | grep ${DOMAIN} | cut -d\" \" -f4 >> ip-addresses.txt;done"
create_new_line
