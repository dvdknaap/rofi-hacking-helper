#!/bin/bash

: '
ffuf: : do a post request with given post data, wordlist and filter to check files (SSRF)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
DIR_WORDLIST_FIELD=$(form_item "directory wordlist" "directory_wordlist" "/usr/share/seclists/Discovery/Web-Content/raft-small-words.txt")
EXT_WORDLIST_FIELD=$(form_item "extensions wordlist" "extension_wordlist" "/usr/share/wordlists/seclists/Discovery/Web-Content/web-extensions.txt")
POST_DATA_FIELD=$(form_item "post data" "post_data" "param1=http://localhost/FUZZ.EXT&")
FILTER_TEXT_FIELD=$(form_item "filter response text" "filter_text" "the requested URL was not found on this server")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${DIR_WORDLIST_FIELD}" "${EXT_WORDLIST_FIELD}" "${POST_DATA_FIELD}" "${FILTER_TEXT_FIELD}"

WEBSITE=${form_data["website"]}
DIR_WORDLIST=${form_data["directory_wordlist"]}
EXT_WORDLIST=${form_data["directory_wordlist"]}
POST_DATA=${form_data["post_data"]}
FILTER_TEXT=${form_data["filter_text"]}

execute_command "ffuf -w ${DIR_WORDLIST}:FUZZ -w ${EXT_WORDLIST}:EXT -u '${WEBSITE}' -X POST -H 'Content-Type: application/x-www-form-urlencoded' -d '${POST_DATA}' -fr '${FILTER_TEXT}'  -v -t 50"
create_new_line
