#!/bin/bash

: '
sqlmap: SQLi on all forms on a websith
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "URL"

URL=${form_data["URL"]}

paste_command "sqlmap -u ${URL} --forms --random-agent --level 5 --risk 3 --batch"
xdotool key Return
