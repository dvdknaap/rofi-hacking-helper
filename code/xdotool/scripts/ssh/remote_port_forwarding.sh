#!/bin/bash

: '
type ssh port forwarding
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "Username"

IP=${form_data["IP"]}
USERNAME=${form_data["Username"]}

paste_command "ssh -R 172.16.8.120:443:0.0.0.0:7000 ${USERNAME}@${IP} -v"

