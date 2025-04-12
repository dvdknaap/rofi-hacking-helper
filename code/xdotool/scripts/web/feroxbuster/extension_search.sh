#!/bin/bash

: '
execute feroxbuster directory search and files with extensions search
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt")
EXT_WORDLIST_FIELD=$(form_item "extension wordlist" "extension_wordlist" "@/usr/share/wordlists/seclists/Discovery/Web-Content/web-extensions.txt")

# Generate GUI form

generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}" "${EXT_WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}
EXT_WORDLIST=${form_data["wordlist"]}

execute_command "feroxbuster -A -u '${WEBSITE}' -w ${WORDLIST} -x ${EXT_WORDLIST} -C 400,403,429"
create_new_line
