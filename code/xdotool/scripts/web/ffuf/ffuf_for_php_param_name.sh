#!/bin/bash

: '
ffuf: search for PHP params
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/wordlists/discovery/burp-parameter-names.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}

execute_command "ffuf -w ${WORDLIST}:FUZZ -u '${WEBSITE}?FUZZ=value'"
create_new_line
