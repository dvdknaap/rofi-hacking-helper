 #!/bin/bash

: '
Crack SPN passwords with hashcat using rockyou.txt.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SPN_FIELD=$(form_item "SPN file" "spn_file")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist_file" "/usr/share/wordlists/rockyou.txt")

# Generate GUI form
generate_form "${HASH_FIELD}" "${WORDLIST_FIELD}"

SPN_FILE=${form_data["spn_file"]}
WORDLIST_FILE=${form_data["wordlist_file"]}

paste_command "hashcat -m 13100 -O -w 3 ${SPN_FILE} ${WORDLIST_FILE}"
xdotool key Return
