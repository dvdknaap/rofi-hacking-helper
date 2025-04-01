#!/bin/bash

: '
Decompile java class file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CLASS_FIELD=$(form_item "CLASS file" "class_file")

# Generate GUI form
generate_form "${CLASS_FIELD}"

CLASS_FILE=${form_data["class_file"]}

execute_command "javap -c ${CLASS_FILE}"
create_new_line
