#!/bin/bash

: '
ffuf: search for directories
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
DIR_WORDLIST_FIELD=$(form_item "directory wordlist" "directory_wordlist" "/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${DIR_WORDLIST_FIELD}"

WEBSITE=${form_data["website"]}
DIR_WORDLIST=${form_data["directory_wordlist"]}

execute_command "ffuf -w ${DIR_WORDLIST} -u '${WEBSITE}/FUZZ' -v -t 50 -maxtime-job 40 -recursion -recursion-depth 2 -recursion-strategy greedy -r > ffuf_directory_results.txt"
create_new_line
