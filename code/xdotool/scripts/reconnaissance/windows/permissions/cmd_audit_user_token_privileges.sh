#!/bin/bash

: '
SharpUp - audit token privileges - cmd: download SharpUp to server and execute.
'

LOCATION="${SCRIPTS_DIR}/reconnaissance/windows/permissions/.files"
FILE="SharpUp.exe"

cmd_upload_file "${LOCATION}" "${FILE}"

execute_command "${FILE_LOCATION}\SharpUp.exe audit TokenPrivileges"
create_new_line
