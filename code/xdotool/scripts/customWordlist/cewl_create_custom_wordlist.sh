#!/bin/bash

: '
cewl - create custom wordlist
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "output file"

WEBSITE=${form_data["Website"]}
OUTPUT_FILE=${form_data["output file"]}

paste_command "cewl '${WEBSITE}' > ${OUTPUT_FILE}"
xdotool key Return