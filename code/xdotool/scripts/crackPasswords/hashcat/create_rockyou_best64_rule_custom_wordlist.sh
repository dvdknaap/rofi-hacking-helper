 #!/bin/bash

: '
Create sorted, unique wordlist from given wordlist + best64.rule.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WORDLIST_FIELD=$(form_item "wordlist" "wordlist_file" "/usr/share/wordlists/rockyou.txt")
OUTPUT_FIELD=$(form_item "output file" "output_file")

# Generate GUI form
generate_form "${HASH_FIELD}" "${OUTPUT_FILE}"

WORDLIST_FILE=${form_data["wordlist_file"]}
OUTPUT_FILE=${form_data["output_file"]}

paste_command "hashcat --force ${WORDLIST_FILE} -r /usr/share/hashcat/rules/best64.rule --stdout | sort -u > ${OUTPUT_FILE}"
xdotool key Return
