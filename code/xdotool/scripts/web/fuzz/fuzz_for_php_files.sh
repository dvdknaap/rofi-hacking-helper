#!/bin/bash

: '
fuzz for PHP files
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-small.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}

execute_command "ffuf -w ${WORDLIST}:FUZZ -u '${WEBSITE}/FUZZ.php'"
create_new_line
