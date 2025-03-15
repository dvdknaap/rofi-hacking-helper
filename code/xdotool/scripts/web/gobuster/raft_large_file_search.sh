#!/bin/bash

: '
gobuster file search with /usr/share/seclists/Discovery/Web-Content/raft-large-files.txtt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "gobuster dir -u '${WEBSITE}' -w /usr/share/seclists/Discovery/Web-Content/raft-large-files.txt -t 40 -b 400,404,403,429 -e"
