#!/bin/bash

: '
secretsdump: dump secrets with SYSTEM, SAM, and SECURITY(optional) database.
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SYSTEM_FILE_FIELD=$(form_item "system file" "system_file" "system.save")
SAM_FILE_FIELD=$(form_item "sam file" "sam_file" "sam.save")
SECURITY_FILE_FIELD=$(form_item "security file (optional)" "security_file" "security.save")

# Generate GUI form
generate_form "${SYSTEM_FILE_FIELD}" "${SAM_FILE_FIELD}" "${SECURITY_FILE_FIELD}"

SYSTEM_FILE=${form_data["system_file"]}
SAM_FILE=${form_data["sam_file"]}
SECURITY_FILE=${form_data["security_file"]}

SECURITY_SWITCH=""
if [[ ! -z "${SECURITY_FILE}" ]]; then
    SECURITY_SWITCH="-security ${SECURITY_FILE}"
fi

execute_command "secretsdump.py LOCAL -system ${SYTEM_FILE} -sam ${SAM_FILE} ${SECURITY_SWITCH}"
create_new_line
