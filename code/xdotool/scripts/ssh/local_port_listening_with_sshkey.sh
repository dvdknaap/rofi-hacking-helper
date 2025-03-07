#!/bin/bash

: '
type ssh port listening with ssh key
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "IP" "SSH key location"

IP=${form_data["IP"]}
SSH_KEY=${form_data["SSH key location"]}
paste_command "ssh -i ${SSH_KEY} -L 7000:127.0.0.1:7000 root@${IP} -v"

