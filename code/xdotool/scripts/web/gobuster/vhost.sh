#!/bin/bash

: '
gobuster vhosts with subdomains-top1million-110000.txt
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}

paste_command "gobuster vhost -u '${WEBSITE}' -w ${WORDLIST} -t 60 --append-domain"
xdotool key Return
