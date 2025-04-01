#!/bin/bash

: '
smtp-user-enum: search for usernames with given domain name (Honeypot-Captures/multiplesources-users-fabian-fingerle.d.txt)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
DOMAIN_FIELD=$(form_item  "domain" "domain")

# Generate GUI form
generate_form "${IP_FIELD}" "${DOMAIN_FIELD}"

IP=${form_data["ip"]}
DOMAIN=${form_data["domain"]}

execute_command "smtp-user-enum -M RCPT -U /usr/share/wordlists/seclists/Usernames/Honeypot-Captures/multiplesources-users-fabian-fingerle.de.txt -D ${DOMAIN} -t ${IP} -m 50"
create_new_line
