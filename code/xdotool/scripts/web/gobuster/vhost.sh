#!/bin/bash

: '
gobuster vhosts with seclists/Discovery/DNS/subdomains-top1million-110000.txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "gobuster vhost -u '${WEBSITE}' -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt -t 60 --append-domain"
