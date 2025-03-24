#!/bin/bash

: '
gobuster directory with directory-list-2.3-medium.txt and extensions worldlist
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt")
EXTENSION_WORDLIST_FIELD=$(form_item "extension wordlist" "extension_wordlist" "/usr/share/wordlists/seclists/Discovery/Web-Content/web-extensions.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}" "${EXTENSION_WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}
EXTENSION_WORDLIST=${form_data["extension_wordlist"]}

paste_command "gobuster dir -u '${WEBSITE}' -w ${WORDLIST} -t 40 -b 400,404,403,429 -e -X ${EXTENSION_WORDLIST}"
xdotool key Return