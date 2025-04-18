#!/bin/bash

: '
create custom wordlist from an existing wordlist and grep uppercase,lowercase,digets and length from the list
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/wordlists/rockyou.txt")
USE_UPPERCASE_FIELD=$(form_item "use uppercase" "select" "use_uppercase" "yes" "no|yes")
USE_LOWERCASE_FIELD=$(form_item "use lowercase" "select" "use_lowercase" "yes" "no|yes")
USE_DIGITS_FIELD=$(form_item "use digits" "select" "use_digits" "yes" "no|yes")
CHAR_LENGTH_FIELD=$(form_item "char length" "number" "char_length" "10")
OUTPUT_FIELD=$(form_item "output file" "output_file" "custom_wordlist.txt")

# Generate GUI form
generate_form "${WORDLIST_FIELD}" "${USE_UPPERCASE_FIELD}" "${USE_LOWERCASE_FIELD}" "${USE_DIGITS_FIELD}" "${CHAR_LENGTH_FIELD}" "${OUTPUT_FIELD}"

WORDLIST=${form_data["wordlist"]}
USE_UPPERCASE=${form_data["use_uppercase"]}
USE_LOWERCASE=${form_data["use_lowercase"]}
USE_DIGITS=${form_data["use_digits"]}
CHAR_LENGTH=${form_data["char_length"]}
OUTPUT_FILE=${form_data["output_file"]}

greps=()

if [[ "${USE_UPPERCASE}" == "yes" ]]; then
    greps+=("[[:upper:]]")
fi

if [[ "${USE_LOWERCASE}" == "yes" ]]; then
    greps+=("[[:lower:]]")
fi

if [[ "${USE_DIGITS}" == "yes" ]]; then
    greps+=("[[:digit:]]")
fi

if [ "${#greps[@]}" == 0 ]; then
    execute_command "#you have select at least one use field: use uppercase, lowercase or digits"
    return
fi

command=""

for k in "${!greps[@]}"; do
    if [[ "${k}" != 0 ]]; then
        command+=" | "
    fi

    command+="grep -a '${greps[$k]}'"

    if [[ "${k}" == 0 ]]; then
        command+=" ${WORDLIST}"
    fi
done

execute_command "${command} | grep -aE '.{${CHAR_LENGTH}}' > ${OUTPUT_FILE}"
create_new_line
