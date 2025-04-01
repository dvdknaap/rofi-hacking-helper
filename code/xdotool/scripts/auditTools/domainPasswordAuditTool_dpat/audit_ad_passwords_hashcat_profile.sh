#!/bin/bash

: '
Domain Password Audit Tool (DPAT)
'

# https://github.com/clr2of8/DPAT

execute_commandndndndndndndndnd 'dpat.py -n customer.ntds -c ~/.local/share/hashcat/hashcat.potfile -g "Domain Admins.txt" "Enterprise Admins.txt"'
create_new_line

