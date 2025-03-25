#!/bin/bash

: '
execute sp_execute_external_script command
'

source "${SCRIPTS_DIR}/sqlDatabase/mssql/.files/sp_execute_external_script.sh"

# Generate gui form
generate_form "CMD"

CMD=${form_data["CMD"]}

execute_external_script "${CMD}"
