#!/bin/bash

: '
show tables in database
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
DATABASE_FIELD=$(form_item  "Database" "database")

# Generate GUI form
generate_form "${DATABASE_FIELD}"

DATABASE=${form_data["database"]}

execute_command "SELECT * FROM ${DATABASE}.INFORMATION_SCHEMA.TABLES"
create_new_line

