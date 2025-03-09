#!/bin/bash

: '
wpscan check for vulnerable plugins
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website"

WEBSITE=${form_data["Website"]}

paste_command "wpscan --url '${WEBSITE}' --enumerate vp"
