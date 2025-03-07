#!/bin/bash

: '
ssh: forward RDP port
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "ssh  -L 13389:172.16.8.20:3389 -i documentation/evidence/notes/root_id_rsa root@10.129.39.56"
