#!/bin/bash

: '
feroxbuster directory with wordlists/dirb/common.txt
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "feroxbuster -u '${WEBSITE}' -w /usr/share/wordlists/dirb/common.txt"
