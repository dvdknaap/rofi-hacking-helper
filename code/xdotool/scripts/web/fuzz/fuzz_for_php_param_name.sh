#!/bin/bash

: '
fuzz for PHP param with /usr/share/wordlists/discovery/burp-parameter-names.txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "ffuf -w /usr/share/wordlists/discovery/burp-parameter-names.txt:FUZZ -u '${WEBSITE}?FUZZ=value'"
