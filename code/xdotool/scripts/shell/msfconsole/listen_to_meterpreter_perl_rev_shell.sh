#!/bin/bash

: '
meterpreter: start meterpreter listener cmd/unix/reverse_perl
'

PAYLOAD="cmd/unix/reverse_perl"
bash ~/Desktop/base/code/xdotool/scripts/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh "${PAYLOAD}"
