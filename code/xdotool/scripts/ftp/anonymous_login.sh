#!/bin/bash

: '
FTP: check for anonymous login
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP"

IP=${form_data["IP"]}

paste_command "ftp ${IP}"
xdotool key Return
sleep 1

paste_command "anonymous"
xdotool key Return
sleep 1

paste_command "anonymous"
xdotool key Return
sleep 1

paste_command "ls"
xdotool key Return
sleep 1