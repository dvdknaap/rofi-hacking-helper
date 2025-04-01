#!/bin/bash

: '
Rubeus: execute createnetonly
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CMD_FIELD=$(form_item  "cmd" "cmd" "C:\Windows\System32\cmd.exe")

# Generate GUI form
generate_form "${CMD_FIELD}"

CMD=${form_data["cmd"]}

execute_command "Rubeus.exe createnetonly /program:\"${CMD}\" /show"
create_new_line
