#!/bin/bash

: '
SCP download file from server
'

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "scp -i documentation/evidence/notes/root_id_rsa root@10.129.39.56:/root/shell.elf ./"