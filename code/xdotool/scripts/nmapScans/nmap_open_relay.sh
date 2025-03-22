#!/bin/bash

: '
Nmap: Check for open SMTP relay.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP"

IP=${form_data["IP"]}

paste_command "nmap -p25 -Pn --script smtp-open-relay ${IP} -vvv"
