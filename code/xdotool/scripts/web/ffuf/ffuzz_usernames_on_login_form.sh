#!/bin/bash

: '
ffuf: fuzz usernames on login form
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
METHOD_FIELD=$(form_item "method" "select" "method" "POST" "GET|POST")
PARAMS_FIELD=$(form_item "post data" "post_data" "username=FUZZ&password=test")
FILTER_STRING_FIELD=$(form_item "filter string" "filter_string" "Unknown user")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/wordlists/seclists/Usernames/xato-net-10-million-usernames.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${METHOD_FIELD}" "${PARAMS_FIELD}" "${FILTER_STRING_FIELD}" "${WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
METHOD=${form_data["method"]}
PARAMS=${form_data["post_data"]}
FILTER_STRING=${form_data["filter_string"]}
WORDLIST=${form_data["wordlist"]}

post_switches=""

if [[ "${METHOD_FIELD}" == "GET" ]]; then
    if [[ "?" != "*${PARAMS}*" ]]; then
        WEBSITE+="?"
    fi

    WEBSITE+="${PARAMS}"
else
    post_switches=" -H 'Content-Type: application/x-www-form-urlencoded' -d '${PARAMS}'"
fi

execute_command "ffuf -X ${METHOD} -w ${WORDLIST}:FUZZ -u '${WEBSITE}'${post_switches} -fs '${FILTER_STRING}' -v -t 50"
create_new_line

