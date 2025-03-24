#!/bin/bash

: '
smtp-user-enum: search for usernames with given domain name (xato-net-10-million-usernames-dup.txt)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "number" "ip" "1337")
DOMAIN_FIELD=$(form_item  "domain" "domain")

# Generate GUI form
generate_form "${IP_FIELD}" "${DOMAIN_FIELD}"

IP=${form_data["ip"]}
DOMAIN=${form_data["domain"]}

paste_command "smtp-user-enum -M RCPT -U /usr/share/wordlists/seclists/Usernames/xato-net-10-million-usernames-dup.txt -D ${DOMAIN} -t ${IP} -m 50"
xdotool key Return