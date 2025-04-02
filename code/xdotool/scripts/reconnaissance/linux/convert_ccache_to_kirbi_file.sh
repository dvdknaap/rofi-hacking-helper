#!/bin/bash

: '
convert ccache file (windows) to kirbi file (linux)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CCACHE_FILE_FIELD=$(form_item  "ccache file" "ccache_file")
KIRBI_FILE_FIELD=$(form_item  "kirbi output file" "kirbi_file" "output.kirbi")

# Generate GUI form
generate_form "${CCACHE_FILE_FIELD}" "${KIRBI_FILE_FIELD}"

CCACHE_FILE=${form_data["ccache_file"]}
KIRBI_FILE=${form_data["kirbi_file"]}

execute_command "python3 ticketConverter.py ${CCACHE_FILE} ${KIRBI_FILE}"
create_new_line
