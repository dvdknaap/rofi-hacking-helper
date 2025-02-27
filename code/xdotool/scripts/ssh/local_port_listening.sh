#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "ssh -i dmz01_key -L 7000:0.0.0.0:7000 root@10.129.203.111 -vN"

