#!/bin/bash

: '
mysql: show all columns of table
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
TABLE_FIELD=$(form_item  "table" "table")

# Generate GUI form
generate_form "${TABLE_FIELD}"

TABLE=${form_data["table"]}

paste_command "show columns from ${TABLE};"
xdotool key Return
