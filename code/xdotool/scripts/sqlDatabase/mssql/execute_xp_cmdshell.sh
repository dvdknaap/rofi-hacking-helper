#!/bin/bash

: '
execute xp_cmdshell command
'

source "${SCRIPTS_DIR}/sqlDatabase/mssql/.files/execute_xp_cmdshell.sh"

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CMD_FIELD=$(form_item  "CMD" "cmd" "whoami")

# Generate GUI form
generate_form "${CMD_FIELD}"

CMD=${form_data["cmd"]}

execute_xp_cmdshell "${CMD}"