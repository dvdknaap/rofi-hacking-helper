#!/bin/bash

: '
wpscan bruteforce user with password file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
USERNAME_FIELD=$(form_item "username" "username")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/wordlist/rockyou.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${USERNAME_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
USERNAME_FIELD=${form_data["username"]}
WORDLIST=${form_data["wordlist"]}

execute_command "wpscan --url ${WEBSITE} --usernames ${USERNAME} --passwords ${WORDLIST} -t 50"
create_new_line
