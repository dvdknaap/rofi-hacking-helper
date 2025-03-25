#!/bin/bash

: '
Domain Password Audit Tool (DPAT)
'

# https://github.com/clr2of8/DPAT

paste_command 'dpat.py -n customer.ntds -c ~/.local/share/hashcat/hashcat.potfile -g "Domain Admins.txt" "Enterprise Admins.txt"'
xdotool key Return

