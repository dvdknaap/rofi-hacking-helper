#!/bin/bash

: '
smbmap: Execute 'whoami' on smb as Administrator with password.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "smbmap -H 172.16.8.20  -u 'Administrator' -p 'password' -x whoami"