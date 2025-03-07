#!/bin/bash

: '
Nmap: Check for open SMTP relay.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "nmap -p25 -Pn --script smtp-open-relay 10.129.203.101 -vvv"
