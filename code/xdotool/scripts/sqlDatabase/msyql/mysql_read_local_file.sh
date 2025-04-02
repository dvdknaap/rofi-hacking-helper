#!/bin/bash

: '
mysql: read local file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
READ_FILE_FIELD=$(form_item  "read file" "read_file" "/etc/passwd")

# Generate GUI form
generate_form "${READ_FILE_FIELD}"

READ_FILE=${form_data["read_file"]}

execute_command "select LOAD_FILE("${READ_FILE}");"
create_new_line
