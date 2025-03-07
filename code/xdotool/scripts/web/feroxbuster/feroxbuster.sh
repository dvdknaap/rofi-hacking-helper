#!/bin/bash

: '
execute feroxbuster directory search
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "feroxbuster -u '${WEBSITE}' -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -C 400,404,403,429"
