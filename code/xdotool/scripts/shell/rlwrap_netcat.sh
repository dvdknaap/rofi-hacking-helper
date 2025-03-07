#!/bin/bash

: '
start rlwrap nc port listening
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "Port"

Port=${form_data["Port"]}
paste_command "rlwrap -cAr nc -lvnp ${Port}"
