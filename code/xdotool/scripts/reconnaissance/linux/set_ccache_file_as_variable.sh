#!/bin/bash

: '
set ccache file as variable KRB5CCNAME
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item  "ccache file" "file")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["file"]}

execute_command "export KRB5CCNAME=${FILE}"
create_new_line
