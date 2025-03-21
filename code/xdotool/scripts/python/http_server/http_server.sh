#!/bin/bash

: '
start http server
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "port"

PORT=${form_data["port"]}

paste_command "python3 -m http.server ${PORT}"
xdotool key Return
