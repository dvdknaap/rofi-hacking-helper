#!/bin/bash

: '
type ssh port listening
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP"

IP=${form_data["IP"]}
paste_command "ssh -L 7000:0.0.0.0:7000 root@${IP} -vN"

