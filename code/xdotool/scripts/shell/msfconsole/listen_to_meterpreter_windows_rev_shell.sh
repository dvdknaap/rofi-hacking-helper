#!/bin/bash

: '
meterpreter: start meterpreter listener windows/meterpreter/reverse_tcp
'

PAYLOAD="windows/meterpreter/reverse_tcp"
bash ~/Desktop/base/code/xdotool/scripts/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh "${PAYLOAD}"
