#!/bin/bash

: '
fuzz vhosts with seclists/Discovery/DNS/namelist.txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "Host header domain"

WEBSITE=${form_data["Website"]}
HOST_HEADER_DOMAIN=${form_data["Host header domain"]}

paste_command "ffuf -w /usr/share/seclists/Discovery/DNS/namelist.txt:FUZZ -u ${WEBSITE} -H 'Host:FUZZ.${HOST_HEADER_DOMAIN}'"
