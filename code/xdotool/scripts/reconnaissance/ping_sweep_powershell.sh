#!/bin/bash

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='1..254 | % {"172.16.5.$($_): $(Test-Connection -count 1 -comp 172.15.5.$($_) -quiet)"}'
paste_command "${command}"
