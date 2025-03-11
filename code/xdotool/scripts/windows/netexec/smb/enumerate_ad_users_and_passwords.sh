#!/bin/bash

: '
enumerate over ad users and password file
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username" "Password"

IP=${form_data["IP"]}
paste_command "netexec smb ${IP} -u documentation/evidence/notes/ad_users.txt -p documentation/evidence/notes/ad_passwords.txt"