#!/bin/bash

: '
local port scan on ip
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP"

IP=${form_data["IP"]}

paste_command "for PORT in {0..1000}; do timeout 1 bash -c \"</dev/tcp/${IP}/\$PORT &>/dev/null\" 2>/dev/null && echo \"port \$PORT is open\"; done"
