#!/bin/bash

: '
meterpreter: set server routes
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP range"

IP_RANGE=${form_data["IP range"]}

paste_command "run autoroute -s ${IP_RANGE}"