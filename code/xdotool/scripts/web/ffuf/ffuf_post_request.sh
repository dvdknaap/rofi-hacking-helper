#!/bin/bash

: '
ffuf: : do a post request with given post data, wordlist and filter (SSRF)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
DIR_WORDLIST_FIELD=$(form_item "directory wordlist" "directory_wordlist" "ports.txt")
POST_DATA_FIELD=$(form_item "post data" "post_data" "dateserver=http://127.0.0.1:FUZZ/&")
FILTER_TEXT_FIELD=$(form_item "filter response text" "filter_text" "Failed to connect to")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${DIR_WORDLIST_FIELD}" "${POST_DATA_FIELD}" "${FILTER_TEXT_FIELD}"

WEBSITE=${form_data["website"]}
DIR_WORDLIST=${form_data["directory_wordlist"]}
POST_DATA=${form_data["post_data"]}
FILTER_TEXT=${form_data["filter_text"]}

execute_command "ffuf -w ${DIR_WORDLIST} -u '${WEBSITE}' -X POST -H 'Content-Type: application/x-www-form-urlencoded' -d '${POST_DATA}' -fr '${FILTER_TEXT}'  -v -t 50"
create_new_line
