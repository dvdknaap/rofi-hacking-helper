#!/bin/bash

: '
fuzz for PHP param
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/wordlists/discovery/burp-parameter-names.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}

paste_command "ffuf -w ${WORDLIST}:FUZZ -u '${WEBSITE}?FUZZ=value'"
xdotool key Return
