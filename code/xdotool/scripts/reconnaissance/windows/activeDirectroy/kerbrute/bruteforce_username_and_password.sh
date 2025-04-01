#!/bin/bash

: '
kerbrute: user enumerate on DC
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
IP_FIELD=$(form_item  "ip" "ip")
USERNAME_WORDLIST_FILE_FIELD=$(form_item  "username wordlist" "username_wordlist_file" "/usr/share/wordlists/seclists/Usernames/top-usernames-shortlist.txt")

# Generate GUI form
generate_form "${IP_FIELD}" "${USERNDOMAIN_FIELDAME_FIELD}" "${USERNAME_WORDLIST_FILE_FIELD}"

DOMAIN=${form_data["domain"]}
IP=${form_data["ip"]}
USERNAME_WORDLIST_FILE=${form_data["username_wordlist_file"]}

execute_command "${SCRIPTS_DIR}/reconnaissance/windows/activeDirectroy/kerbrute/.files/kerbrute userenum -d ${DOMAIN} --dc ${IP} ${USERNAME_WORDLIST_FILE} -v"
create_new_line
