#!/bin/bash

"""
Powershell - login to user on a different computer
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

paste_command "Enter-PSSession -ComputerName DEV01 -Credential INLANEFREIGHT\backupadm"