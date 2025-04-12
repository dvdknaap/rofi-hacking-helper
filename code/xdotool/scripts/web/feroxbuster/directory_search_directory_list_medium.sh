#!/bin/bash

: '
feroxbuster directory search directory-list-2.3-medium.txt
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}

execute_command "feroxbuster -A -u '${WEBSITE}' -w ${WORDLIST}"
create_new_line
