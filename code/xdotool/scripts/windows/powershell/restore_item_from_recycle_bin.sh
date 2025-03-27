#!/bin/bash

: '
Powershell: restore item from recycle bin
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_NAME_FIELD=$(form_item  "file name" "file_name")

# Generate GUI form
generate_form "${FILE_NAME_FIELD}"

FILE=${form_data["file_name"]}

TMP_FOLDER="C:\temp"

paste_command 'New-Item -Path "c:\" -Name "temp" -ItemType "directory"'
xdotool key Return
sleep 0.8

paste_command "\$shell = New-Object -com shell.application"
xdotool key Return
sleep 0.8

paste_command "\$rb = \$shell.Namespace(10)"
xdotool key Return
sleep 0.8

paste_command "\$Undelete = \$rb.Items() | Where-Object {\$_.Name -like '${FILE}'}"
xdotool key Return
sleep 0.8

paste_command "Copy-Item -Path \$Undelete.Path -Destination ${TMP_FOLDER}/${FILE} -Force"
xdotool key Return
sleep 0.8
