#!/bin/bash

: '
Check if we can execute expect to execute commands
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "Cmd"

WEBSITE=${form_data["Website"]}
CMD=${form_data["Cmd"]}

paste_command "curl -ks '${WEBSITE}expect://${FILE}'"
