#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='ffuf -w /usr/share/seclists/Discovery/DNS/namelist.txt:FUZZ -u http://10.129.175.113/ -H 'Host:FUZZ.inlanefreight.local' -fs 15157'
paste_command "${command}"
