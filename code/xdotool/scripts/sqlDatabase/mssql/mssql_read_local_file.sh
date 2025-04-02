#!/bin/bash

: '
mssql: read local file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
READ_FILE_FIELD=$(form_item  "read file" "read_file" "C:/Windows/System32/drivers/etc/hosts")

# Generate GUI form
generate_form "${READ_FILE_FIELD}"

READ_FILE=${form_data["read_file"]}

execute_command "SELECT * FROM OPENROWSET(BULK N'${READ_FILE}', SINGLE_CLOB) AS Contents"
create_new_line
sleep 0.8

execute_command "GO"
create_new_line
