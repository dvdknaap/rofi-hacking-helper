#!/bin/bash

: '
check current username
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LINKED_SERVER_FIELD=$(form_item  "linked server" "linked_server")

# Generate GUI form
generate_form "${LINKED_SERVER_FIELD}"

LINKED_SERVER=${form_data["linked_server"]}

execute_command "EXECUTE('select @@servername, @@version, system_user, is_srvrolemember(''sysadmin'')') AT [${LINKED_SERVER}]"
create_new_line
