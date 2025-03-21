#!/bin/bash

: '
ping sweep - check if ips are alive in ip range 0.0.0
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Ip range"

IPRANGE=${form_data["Ip range"]}

paste_command "1..254 | % {\"${IPRANGE}.\$(\$_): \$(Test-Connection -count 1 -comp ${IPRANGE}.\$(\$_) -quiet)\"}"
