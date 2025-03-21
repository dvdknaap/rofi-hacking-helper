#!/bin/bash

: '
sqlmap: show specific database tables
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "URL" "DB"

URL=${form_data["URL"]}
DB=${form_data["DB"]}

paste_command "sqlmap -u ${URL} -D '${DB}' --tables --random-agent --level 5 --risk 3 --batch"
xdotool key Return
