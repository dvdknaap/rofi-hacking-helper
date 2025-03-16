#!/bin/bash

: '
Powershell: restore item from recycle bin
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "File name"

FILE=${form_data["File name"]}

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
