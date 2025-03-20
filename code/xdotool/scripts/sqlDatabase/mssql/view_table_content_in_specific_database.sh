#!/bin/bash

: '
view content in table in specific database
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Database" "Table"

DATABASE=${form_data["Database"]}
TABLE=${form_data["Table"]}

paste_command "use ${DATABASE}"
xdotool key Return
sleep 0.8

paste_command "select * from ${TABLE};"
xdotool key Return
sleep 0.8
