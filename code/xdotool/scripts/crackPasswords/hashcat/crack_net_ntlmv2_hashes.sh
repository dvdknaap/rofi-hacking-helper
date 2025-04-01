 #!/bin/bash

: '
Crack NetNTLMv2 hashes with hashcat.
'


# Generate GUI form items (label, type (optional: default text), name, default (optional))
HASH_FIELD=$(form_item "hash file" "hash_file")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist_file" "/usr/share/wordlists/rockyou.txt")

# Generate GUI form
generate_form "${HASH_FIELD}" "${WORDLIST_FIELD}"

HASH_FILE=${form_data["hash_file"]}
WORDLIST_FILE=${form_data["wordlist_file"]}

execute_command "hashcat -m 5600 -O -w 3 ${HASH_FILE} ${WORDLIST_FILE}"
create_new_line
