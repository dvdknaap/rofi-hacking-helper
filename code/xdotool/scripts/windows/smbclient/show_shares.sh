#!/bin/bash

: '
smbclient: List shares.
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "smbclient -L 10.129.9.124"