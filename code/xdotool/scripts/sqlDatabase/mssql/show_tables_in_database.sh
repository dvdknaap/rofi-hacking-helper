#!/bin/bash

: '
show tables in database
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Database"

DATABASE=${form_data["Database"]}

paste_command "SELECT * FROM ${DATABASE}.INFORMATION_SCHEMA.TABLES"
xdotool key Return

