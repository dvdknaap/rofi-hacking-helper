#!/bin/bash

: '
ldapsearch check for specific namingcontexts
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}' "namingcontexts"

IP=${form_data["IP"]}
NAMING_CONTEXTS=${form_data["namingcontexts"]}

paste_command "ldapsearch -H ldap://${IP} -x -b \"DC=${NAMING_CONTEXTS}\""
xdotool key Return