#!/bin/bash

: '
check if null session is possible
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP"

IP=${form_data["IP"]}
paste_command "netexec smb ${IP} -u \"\" up \"\""