#!/bin/bash

: '
view content in table in specific database
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DATABASE_FIELD=$(form_item "database" "database")
TABLE_FIELD=$(form_item "table" "table")

# Generate GUI form
generate_form "${DATABASE_FIELD}" "${TABLE_FIELD}"

DATABASE=${form_data["database"]}
TABLE=${form_data["table"]}

execute_command "use ${DATABASE}"
create_new_line
sleep 0.8

execute_command "select * from ${TABLE};"
create_new_line
sleep 0.8
