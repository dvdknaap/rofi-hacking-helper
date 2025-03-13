#!/bin/bash

: '
wget: download files from ftp
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "username" "password" "level_depth"

IP=${form_data["IP"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}
LEVEL_DEPTH=${form_data["level_depth"]}

paste_command "wget --no-verbose --no-parent --recursive --level=${LEVEL_DEPTH} --no-directories --user='${USERNAME}' --password='${PASSWORD}' ftp://${IP}/"
xdotool key Return
sleep 1