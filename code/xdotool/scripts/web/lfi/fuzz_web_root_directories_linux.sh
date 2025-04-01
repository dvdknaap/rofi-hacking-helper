#!/bin/bash

: '
fuzz for web root directories - linux
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Discovery/Web-Content/default-web-root-directory-linux.txt")
FILE_FIELD=$(form_item "file" "file" "index.php")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}" "${FILE_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}
FILE=${form_data["file"]}

execute_command "ffuf -w ${WORDLIST}:FUZZ -u '${WEBSITE}FUZZ/${FILE}' -fs 0"
create_new_line
