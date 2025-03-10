#!/bin/bash

: '
cewl - create custom wordlist
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "cewl ${WEBSITE} > documentation/evidence/miscFiles/wordlist.txt"