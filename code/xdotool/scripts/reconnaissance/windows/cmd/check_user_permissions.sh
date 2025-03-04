#!/bin/bash

"""
Check user permissions and other usefull pentest info
"""

source ~/Desktop/base/code/xdotool/helpers/paste_commands.sh

command='@echo whoami: && whoami /all && echo. && echo net user: && net user && echo. && echo dir C:\Users: && dir C:\Users && echo. && echo systeminfo: && systeminfo | findstr /B /C:"OS Name" /C:"OS Version" && echo. && echo ver: && ver && echo. && echo net localgroup Administrators: && net localgroup Administrators'
paste_command "${command}"
