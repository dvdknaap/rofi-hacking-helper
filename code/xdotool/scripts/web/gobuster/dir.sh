#!/bin/bash

: '
gobuster directory with seclists/Discovery/DNS/subdomains-top1million-110000.txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "gobuster dir -u '${WEBSITE}' -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -t 40 -b 400,404,403,429 -e -X /usr/share/wordlists/seclists/Discovery/Web-Content/web-extensions.txt -r"