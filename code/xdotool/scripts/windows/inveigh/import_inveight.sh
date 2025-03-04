#!/bin/bash

"""
Import Inveigh.ps1
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

: ' 
https://github.com/Kevin-Robertson/Inveigh
mkdir /opt/windows/ && git clone https://github.com/Kevin-Robertson/Inveigh -o /opt/windows/Inveigh
'

paste_command "Import-Module .\Inveigh.ps1"