#!/bin/bash

: '
meterpreter: start meterpreter listener linux/x86/meterpreter/reverse_tcp
'

PAYLOAD="linux/x86/meterpreter/reverse_tcp"
bash ~/Desktop/base/code/xdotool/scripts/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh "${PAYLOAD}"