#!/bin/bash

: '
execute xp_cmdshell command
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "CMD"

CMD=${form_data["CMD"]}
paste_command "EXEC xp_cmdshell \"${CMD}\";"
xdotool key Return