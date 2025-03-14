#!/bin/bash

: '
ping sweep - check if ips are alive in ip range 0.0.0
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip range"

IPRANGE=${form_data["Ip range"]}

paste_command "for i in \$(seq 254); do ping ${IPRANGE}.\$i -c1 -W1 & done | grep from"
