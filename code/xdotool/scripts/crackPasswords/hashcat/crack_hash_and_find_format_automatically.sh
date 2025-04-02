 #!/bin/bash

: '
crack hashes and find format automatically
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
HASH_FIELD=$(form_item "hash file" "hash_file")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist_file" "/usr/share/wordlists/rockyou.txt")
RULE_FILE_FIELD=$(form_item "rule (optional)" "rule_file")

# Generate GUI form
generate_form "${HASH_FIELD}" "${WORDLIST_FIELD}" "${RULE_FILE_FIELD}"

HASH_FILE=${form_data["hash_file"]}
WORDLIST_FILE=${form_data["wordlist_file"]}
RULE_FILE=${form_data["rule_file"]}

rule_switch=""
if [[ "${RULE_FILE}" != "" ]]; then
    rule_switch=" -r ${RULE_FILE}"
fi

execute_command "hashcat -a 0 -O -w 3 ${HASH_FILE} ${WORDLIST_FILE} ${rule_switch}"
create_new_line
