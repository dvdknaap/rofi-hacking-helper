#!/bin/bash

: '
get user Ticket Granting Ticket (TGT)
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form '{"label": "IP address", "type": "text", "name": "IP"}' "domain"'{"label": "Username", "type": "text", "name": "username"}'"password"

IP=${form_data["IP"]}
DOMAIN=${form_data["domain"]}
USERNAME=${form_data["username"]}
PASSWORD=${form_data["password"]}

paste_command "sudo ntpdate ${IP};getTGT.py -dc-ip {IP} ${DOMAIN}/${USERNAME}:'${PASSWORD}'"
xdotool key Return
sleep 4

paste_command "export KRB5CCNAME=*.ccache"
xdotool key Return