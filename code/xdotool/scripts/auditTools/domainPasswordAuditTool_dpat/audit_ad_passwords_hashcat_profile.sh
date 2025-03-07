#!/bin/bash

: '
Domain Password Audit Tool (DPAT)
'

# https://github.com/clr2of8/DPAT

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command 'dpat.py -n customer.ntds -c ~/.local/share/hashcat/hashcat.potfile -g "Domain Admins.txt" "Enterprise Admins.txt"'

