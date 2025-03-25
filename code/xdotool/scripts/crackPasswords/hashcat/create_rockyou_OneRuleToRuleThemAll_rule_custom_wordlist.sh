 #!/bin/bash

: '
Create sorted, unique wordlist: given wordlist + OneRuleToRuleThemAll.rule.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WORDLIST_FIELD=$(form_item "wordlist" "wordlist_file" "/usr/share/wordlists/rockyou.txt")
OUTPUT_FIELD=$(form_item "output file" "output_file")

# Generate GUI form
generate_form "${HASH_FIELD}" "${WORDLIST_FIELD}"

WORDLIST_FILE=${form_data["wordlist_file"]}
OUTPUT_FILE=${form_data["output_file"]}

paste_command "hashcat --force ${WORDLIST_FILE} -r ${SCRIPTS_DIR}/crackPasswords/hashcat/.rules/OneRuleToRuleThemAll.rule --stdout | sort -u > ${OUTPUT_FILE}"
xdotool key Return
