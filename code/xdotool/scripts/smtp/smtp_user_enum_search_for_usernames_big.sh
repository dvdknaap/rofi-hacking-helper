#!/bin/bash

: '
smtp-user-enum: search for usernames with given domain name (xato-net-10-million-usernames-dup.txt)
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "domain"

IP=${form_data["IP"]}
DOMAIN=${form_data["domain"]}

paste_command "smtp-user-enum -M RCPT -U /usr/share/wordlists/seclists/Usernames/xato-net-10-million-usernames-dup.txt -D ${DOMAIN} -t ${IP} -m 50"
