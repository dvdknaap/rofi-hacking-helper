#!/bin/bash

: '
mysql: show everything in the desired table
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
TABLE_FIELD=$(form_item  "table" "table")

# Generate GUI form
generate_form "${TABLE_FIELD}"

TABLE=${form_data["table"]}

paste_command "select * from ${TABLE}/G"
xdotool key Return
