#!/bin/bash

: '
fuzz for PHP param value
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?FUZZ=")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Fuzzing/LFI/LFI-Jhaddix.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}

paste_command "ffuf -w ${WORDLIST}:FUZZ -u '${WEBSITE}FUZZ'"
xdotool key Return
