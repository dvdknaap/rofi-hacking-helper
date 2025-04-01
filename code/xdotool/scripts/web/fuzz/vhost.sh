#!/bin/bash

: '
fuzz vhosts
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
HOST_HEADER_DOMAIN_FIELD=$(form_item "Host header domain" "host_header_domain" "domain.com")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Discovery/DNS/namelist.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${HOST_HEADER_DOMAIN_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
HOST_HEADER_DOMAIN=${form_data["host_header_domain"]}
WORDLIST=${form_data["wordlist"]}

execute_command "ffuf -w ${WORDLIST}:FUZZ -u ${WEBSITE} -H 'Host:FUZZ.${HOST_HEADER_DOMAIN}'"
create_new_line
