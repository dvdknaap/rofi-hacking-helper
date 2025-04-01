#!/bin/bash

: '
gobuster file search with /usr/share/seclists/Discovery/Web-Content/raft-large-files.txtt
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Discovery/Web-Content/raft-large-files.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}

execute_command "gobuster dir -u '${WEBSITE}' -w ${WORDLIST} -t 40 -b 400,404,403,429 -e"
create_new_line
