#!/bin/bash

: '
fuzz for LFI files with LFI-LFISuite-pathtotest-huge.txt
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Fuzzing/LFI/LFI-LFISuite-pathtotest-huge.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}

execute_command "ffuf -ic -c -w ${WORDLIST}:FUZZ -u '${WEBSITE}FUZZ' -v -fs 0"
create_new_line
