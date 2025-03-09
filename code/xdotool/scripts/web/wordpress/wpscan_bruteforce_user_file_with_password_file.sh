#!/bin/bash

: '
wpscan bruteforce user file with password file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "UsernameFile" "PasswordFile"

WEBSITE=${form_data["Website"]}
USERNAMEFILE=${form_data["UsernameFile"]}
PASSWORDFILE=${form_data["PasswordFile"]}

paste_command "wpscan --url ${WEBSITE} --usernames ${USERNAMEFILE} --passwords ${PASSWORDFILE}  -t 50"