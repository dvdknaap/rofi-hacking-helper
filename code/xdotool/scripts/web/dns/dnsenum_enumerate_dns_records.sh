#!/bin/bash

: '
dnsenum: enumerate dns records
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item "domain" "domain")
DNS_SERVER_IP_FIELD=$(form_item "dns server ip" "dns_server_ip")
OUTPUT_FILE_FIELD=$(form_item "output file" "output_file" "subdomains.txt")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${DNS_SERVER_IP_FIELD}" "${OUTPUT_FILE_FIELD}"

DOMAIN=${form_data["domain"]}
DNS_SERVER_IP=${form_data["dns_server_ip"]}
OUTPUT_FILE=${form_data["output_file"]}

execute_command "dnsenum --dnsserver ${DNS_SERVER_IP} --enum -p 0 -s 0 -o ${OUTPUT_FILE_FIELD} -f /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt ${DOMAIN}"
create_new_line
