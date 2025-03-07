#!/bin/bash

: '
Nmap: Check for open SMTP relay.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/run_with_proxychains.sh

run_with_proxychains $0