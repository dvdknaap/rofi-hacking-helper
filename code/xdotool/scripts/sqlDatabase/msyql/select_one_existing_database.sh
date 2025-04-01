#!/bin/bash

: '
mysql: Select one of the existing databases
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DATABASE_FIELD=$(form_item  "database" "database")

# Generate GUI form
generate_form "${DATABASE_FIELD}"

DATABASE=${form_data["database"]}

execute_command "use ${DATABASE};"
create_new_line
