#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command="xfreerdp3 /u:'user' /p:'pass' /v:ip /cert:ignore /smart-sizing /size:1920x1080  /drive:tools,\"$(pwd)/inlaneFreight\""
paste_command "${command}"
